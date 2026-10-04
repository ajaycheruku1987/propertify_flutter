import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:propertify/core/key_properties.dart';

class AiInsightsWidget extends StatefulWidget {
  final String title;
  final String city;
  final String address;
  final int? price;
  final String? propertyType;

  const AiInsightsWidget({
    super.key,
    required this.title,
    required this.city,
    required this.address,
    this.price,
    this.propertyType,
  });

  @override
  State<AiInsightsWidget> createState() => _AiInsightsWidgetState();
}

class _AiInsightsWidgetState extends State<AiInsightsWidget> {
  bool _isLoading = false;
  String? _insights;
  String? _error;

  Future<void> _generateInsights() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final apiKey = KeyProperties.geminiApiKey;
      if (apiKey == 'YOUR_GEMINI_API_KEY_HERE' || apiKey.isEmpty) {
        setState(() {
          _error = 'Gemini API key is not configured. Please update `KeyProperties.geminiApiKey` in `lib/core/key_properties.dart` with a valid Gemini API key from Google AI Studio to enable live AI analysis.';
          _isLoading = false;
        });
        return;
      }

      final prompt = '''
Provide a professional real estate neighborhood analysis and investment outlook for the following property:
- Title: ${widget.title}
- Property Type: ${widget.propertyType ?? 'Residential'}
- Location: ${widget.address}, ${widget.city}
- Price: ₹${widget.price ?? 'N/A'}

Format your response with clear bullet points covering:
1. Proximity & Education
2. Healthcare Access
3. Connectivity & Transit
4. Investment & Rental Outlook
5. Neighborhood Vibe & Safety
Keep it concise, professional, and engaging for property buyers.
''';

      final modelNames = [
        'gemini-1.5-flash',
        'gemini-pro',
        'gemini-1.5-pro',
        'gemini-1.5-flash-latest',
      ];

      String? generatedText;
      Object? lastError;

      for (final modelName in modelNames) {
        try {
          final model = GenerativeModel(
            model: modelName,
            apiKey: apiKey,
          );
          final response = await model.generateContent([Content.text(prompt)]);
          if (response.text != null && response.text!.isNotEmpty) {
            generatedText = response.text;
            break;
          }
        } catch (e) {
          lastError = e;
          // Try next model name
        }
      }

      if (generatedText != null) {
        setState(() {
          _insights = generatedText;
          _isLoading = false;
        });
      } else {
        throw lastError ?? Exception('Failed to generate insights with any Gemini model.');
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to generate AI insights: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor.withValues(alpha: 0.05),
            Colors.purple.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: primaryColor.withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gemini AI Assistant',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2),
                          Text(
                            'AI Investment & Location Insights',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (_insights == null && !_isLoading) ...[
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: _generateInsights,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.flash_on, size: 14),
                  label: const Text(
                    'Analyze',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ],
          ),
          if (_isLoading) ...[
            const SizedBox(height: 16),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Analyzing location with Gemini AI...',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ] else if (_error != null) ...[
            const SizedBox(height: 14),
            const Divider(height: 1),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Colors.redAccent,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: _generateInsights,
                  icon: const Icon(Icons.refresh, size: 14),
                  label: const Text('Try Again', style: TextStyle(fontSize: 12)),
                  style: TextButton.styleFrom(
                    foregroundColor: primaryColor,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                  ),
                ),
              ],
            ),
          ] else if (_insights != null) ...[
            const SizedBox(height: 14),
            const Divider(height: 1),
            const SizedBox(height: 14),
            Text(
              _insights!,
              style: const TextStyle(
                fontSize: 13.5,
                height: 1.5,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: _generateInsights,
                  icon: const Icon(Icons.refresh, size: 14),
                  label: const Text('Refresh Analysis', style: TextStyle(fontSize: 12)),
                  style: TextButton.styleFrom(
                    foregroundColor: primaryColor,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                  ),
                ),
              ],
            ),
          ] else ...[
            const SizedBox(height: 10),
            const Text(
              'Tap "Analyze" to trigger a live query to Google Gemini AI for instant neighborhood reviews, school proximity, and investment outlook for this property.',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
