import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/theme/theme_definition.dart';
import 'package:template/utils/list_extensions.dart';
import 'package:template/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _SocialButton(
          fileName: 'github_logo',
          url: 'github.com/MarcKlesiewicz',
        ),
        const _SocialButton(
          fileName: 'linkedin_logo',
          url: 'www.linkedin.com/in/marc-klesiewicz-584910194/',
        ),
        const _SocialButton(
          fileName: 'instagram_logo',
          url: 'www.instagram.com/marccmarc',
        ),
        const _SocialButton(
          fileName: 'facebook_logo',
          url: 'www.facebook.com/marc.klesiewicz/',
        ),
        const _SocialButton(
          fileName: 'mail_logo',
          url: 'marcklesiewicz21@gmail.com',
        )
      ].gap(Gaps.mdH),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final String fileName;
  final String url;
  final bool isMail;
  const _SocialButton({
    Key? key,
    required this.fileName,
    required this.url,
    this.isMail = false,
  }) : super(key: key);

  @override
  State<_SocialButton> createState() => __SocialButtonState();
}

class __SocialButtonState extends State<_SocialButton> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: Stack(
        children: [
          IconButton(
            onPressed: () => _launchUrl(),
            icon: SvgPicture.asset(
              'svgs/${widget.fileName}.svg',
            ),
          ),
          AnimatedOpacity(
            opacity: isHovering ? 1 : 0,
            duration: Durations.ms200,
            child: IconButton(
              onPressed: () => _launchUrl(),
              icon: SvgPicture.asset(
                'svgs/${widget.fileName}.svg',
                colorFilter: ColorFilter.mode(
                  context.colors.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(
      Uri(
        scheme: widget.isMail ? 'mailTo' : 'https',
        path: widget.url,
      ),
    )) {
      throw Exception('Could not launch ${widget.url}');
    }
  }
}
