import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.experienceYears,
    required this.clients,
    required this.rating,
    this.buttonText = 'View Profile',
    this.onPressed,
  });

  final String image;
  final String title;
  final String subtitle;
  final int experienceYears;
  final int clients;
  final double rating;
  final String buttonText;
  final VoidCallback? onPressed;

  bool get _isNetworkImage =>
      image.startsWith('http://') || image.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorPalette.inputColor,
        border: Border.all(color: ColorPalette.borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _isNetworkImage
                ? Image.network(
                    image,
                    width: 72,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    image,
                    width: 72,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleLarge?.copyWith(fontSize: 15),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _RatingBadge(rating: rating),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                    color: ColorPalette.blue,
                    fontWeight: FontWeight.w500,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    _InfoItem(
                      icon: Icons.timer_outlined,
                      text: '$experienceYears yrs exp',
                    ),
                    const SizedBox(width: 10),
                    _InfoItem(
                      icon: Icons.groups_outlined,
                      text: '$clients clients',
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 28,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF334155),
                      disabledBackgroundColor: const Color(0xFF334155),
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: textTheme.bodySmall?.copyWith(
                        color: ColorPalette.mainTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: ColorPalette.levelContainerColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: ColorPalette.blue, size: 10),
          const SizedBox(width: 3),
          Text(
            rating.toStringAsFixed(1),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorPalette.blue,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: ColorPalette.secondTextColor, size: 13),
          const SizedBox(width: 3),
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                    height: 1,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
