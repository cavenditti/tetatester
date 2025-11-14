import 'package:flutter/material.dart';

class ActionButtonsWidget extends StatelessWidget {
  final VoidCallback? onPickFromCamera;
  final VoidCallback? onPickFromGallery;
  final VoidCallback? onAnalyze;
  final bool isAnalyzing;

  const ActionButtonsWidget({
    super.key,
    this.onPickFromCamera,
    this.onPickFromGallery,
    this.onAnalyze,
    this.isAnalyzing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image Selection Buttons
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: isAnalyzing ? null : onPickFromCamera,
                icon: const Icon(Icons.camera_alt),
                label: const Text('Camera'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: isAnalyzing ? null : onPickFromGallery,
                icon: const Icon(Icons.photo_library),
                label: const Text('Gallery'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Analyze Button
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: isAnalyzing ? null : onAnalyze,
            icon: isAnalyzing
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  )
                : const Icon(Icons.search),
            label: Text(
              isAnalyzing ? 'Analyzing...' : 'Count Cows',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Help Text
        if (onAnalyze == null)
          Text(
            'Please select an image first',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}