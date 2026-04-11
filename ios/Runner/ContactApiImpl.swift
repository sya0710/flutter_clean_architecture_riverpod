import Foundation
import Contacts

enum ContactApiError: Error {
    case permissionDenied
    case fetchFailed(String)

    var code: String {
        switch self {
        case .permissionDenied: return "PERMISSION_DENIED"
        case .fetchFailed:      return "FETCH_FAILED"
        }
    }

    var message: String {
        switch self {
        case .permissionDenied: return "Permission denied to access contacts."
        case .fetchFailed(let details): return details
        }
    }
}

class ContactApiImpl: NSObject, ContactApi {
    func getContacts() throws -> [Contact] {
        let store = CNContactStore()

        guard CNContactStore.authorizationStatus(for: .contacts) == .authorized else {
            throw ContactApiError.permissionDenied
        }

        let keys: [CNKeyDescriptor] = [
            CNContactGivenNameKey as NSString,
            CNContactMiddleNameKey as NSString,
            CNContactFamilyNameKey as NSString,
            CNContactPhoneNumbersKey as NSString,
            CNContactEmailAddressesKey as NSString
        ]

        var contacts: [Contact] = []
        let request = CNContactFetchRequest(keysToFetch: keys)

        do {
            try store.enumerateContacts(with: request) { cn, _ in
                var contact = Contact()
                let fullName = [cn.givenName,
                                cn.middleName,
                                cn.familyName]
                .filter { !$0.isEmpty }
                .joined(separator: " ")
                contact.displayName = fullName.isEmpty ? nil : fullName

                // Email
                if !cn.emailAddresses.isEmpty {
                    contact.emails = cn.emailAddresses.map {
                        String($0.value as String)
                    }
                }

                // Phone
                if !cn.phoneNumbers.isEmpty {
                    contact.phones = cn.phoneNumbers.map {
                        $0.value.stringValue
                    }
                }

                contacts.append(contact)
            }
        } catch {
            throw ContactApiError.fetchFailed(error.localizedDescription)
        }

        return contacts
    }
}