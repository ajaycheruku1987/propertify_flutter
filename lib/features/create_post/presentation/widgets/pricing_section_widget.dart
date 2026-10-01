import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/create_post_bloc.dart';

class PricingSectionWidget extends StatefulWidget {
  const PricingSectionWidget({super.key});

  @override
  State<PricingSectionWidget> createState() => _PricingSectionWidgetState();
}

class _PricingSectionWidgetState extends State<PricingSectionWidget> {
  late TextEditingController _priceController;
  late TextEditingController _depositController;

  @override
  void initState() {
    super.initState();
    final state = context.read<CreatePostBloc>().state;
    _priceController = TextEditingController(text: state.price);
    _depositController = TextEditingController(text: state.securityDeposit);
  }

  @override
  void dispose() {
    _priceController.dispose();
    _depositController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return BlocBuilder<CreatePostBloc, CreatePostState>(
      builder: (context, state) {
        final isRentOrLease = state.selectedLookingFor.toLowerCase() == 'rent' ||
            state.selectedLookingFor.toLowerCase() == 'lease';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Price Label
            Text(
              isRentOrLease ? 'Monthly Rent (₹) *' : 'Property Price (₹) *',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // Price Field
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: '₹ ',
                hintText: isRentOrLease ? 'e.g. 25,000 / month' : 'e.g. 75,00,000',
                filled: true,
                fillColor: Colors.grey.shade50,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              onChanged: (val) {
                context
                    .read<CreatePostBloc>()
                    .add(CreatePostEvent.priceChanged(price: val));
              },
            ),

            const SizedBox(height: 12),

            // If SALE: Show Negotiable Checkbox
            if (!isRentOrLease)
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                activeColor: primaryColor,
                title: const Text(
                  'Price is Negotiable',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                value: state.isNegotiable,
                onChanged: (val) {
                  context.read<CreatePostBloc>().add(
                        CreatePostEvent.isNegotiableChanged(
                          isNegotiable: val ?? false,
                        ),
                      );
                },
              ),

            // If RENT/LEASE: Show Security Deposit Field
            if (isRentOrLease) ...[
              const Text(
                'Security Deposit (₹)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _depositController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: '₹ ',
                  hintText: 'e.g. 1,00,000',
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                onChanged: (val) {
                  context.read<CreatePostBloc>().add(
                        CreatePostEvent.securityDepositChanged(
                          securityDeposit: val,
                        ),
                      );
                },
              ),
            ],
          ],
        );
      },
    );
  }
}
