import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlive/app/presentation/providers/app_notifier.dart';
import 'package:riverpodlive/core/config/lang/l10n/l10n.dart';
import 'package:riverpodlive/core/helpers/utils.dart';
import 'package:riverpodlive/core/presentation/pages/base_page.dart';
import 'package:riverpodlive/features/contacts/data/requests/get_list_contact_request.dart';
import 'package:riverpodlive/features/contacts/presentation/providers/contact_notifier.dart';

class ContactPage extends HookConsumerWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ContactPageView();
  }
}

class ContactPageView extends BasePage {
  const ContactPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() {
        if (!context.mounted) return null;
        ref.read(appProvider.notifier).setAppTitle(context.l10n.contact);

        ref
            .read(contactProvider.notifier)
            .getAllContactFromApi(const GetListContactRequest());
      });

      return null;
    }, const []);

    final state = ref.watch(contactProvider);
    return state.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      ),
      data: (data) {
        return Center(
          child: RefreshIndicator(
            onRefresh: () async {
              await ref.read(contactProvider.notifier).getAllContact();
            },
            child: ListView.builder(
              itemCount: data.contacts.length,
              itemBuilder: (context, index) {
                final contact = data.contacts[index];
                return ListTile(
                  title: Text(Utils.getEmployeeName(contact)),
                );
              },
            ),
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
