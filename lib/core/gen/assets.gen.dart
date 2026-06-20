// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Lexend-Bold.ttf
  String get lexendBold => 'assets/fonts/Lexend-Bold.ttf';

  /// List of all assets
  List<String> get values => [lexendBold];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/active_favourite_icon.svg
  SvgGenImage get activeFavouriteIcon =>
      const SvgGenImage('assets/icons/active_favourite_icon.svg');

  /// File path: assets/icons/active_home_icon.svg
  SvgGenImage get activeHomeIcon =>
      const SvgGenImage('assets/icons/active_home_icon.svg');

  /// File path: assets/icons/active_plans_icon.svg
  SvgGenImage get activePlansIcon =>
      const SvgGenImage('assets/icons/active_plans_icon.svg');

  /// File path: assets/icons/active_trainers_icon.svg
  SvgGenImage get activeTrainersIcon =>
      const SvgGenImage('assets/icons/active_trainers_icon.svg');

  /// File path: assets/icons/inactive_favourite_icon.svg
  SvgGenImage get inactiveFavouriteIcon =>
      const SvgGenImage('assets/icons/inactive_favourite_icon.svg');

  /// File path: assets/icons/inactive_plans_icon.svg
  SvgGenImage get inactivePlansIcon =>
      const SvgGenImage('assets/icons/inactive_plans_icon.svg');

  /// File path: assets/icons/inactive_profile_icon (4).svg
  SvgGenImage get inactiveProfileIcon4 =>
      const SvgGenImage('assets/icons/inactive_profile_icon (4).svg');

  /// File path: assets/icons/inactive_trainers_icon.svg
  SvgGenImage get inactiveTrainersIcon =>
      const SvgGenImage('assets/icons/inactive_trainers_icon.svg');

  /// File path: assets/icons/logo_icon.svg
  SvgGenImage get logoIcon => const SvgGenImage('assets/icons/logo_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    activeFavouriteIcon,
    activeHomeIcon,
    activePlansIcon,
    activeTrainersIcon,
    inactiveFavouriteIcon,
    inactivePlansIcon,
    inactiveProfileIcon4,
    inactiveTrainersIcon,
    logoIcon,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Splash Screen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/images/Splash Screen.png');

  /// File path: assets/images/advanced_image.png
  AssetGenImage get advancedImage =>
      const AssetGenImage('assets/images/advanced_image.png');

  /// File path: assets/images/beginer_image.png
  AssetGenImage get beginerImage =>
      const AssetGenImage('assets/images/beginer_image.png');

  /// File path: assets/images/hero_image_section.png
  AssetGenImage get heroImageSection =>
      const AssetGenImage('assets/images/hero_image_section.png');

  /// File path: assets/images/intermedaite_image.png
  AssetGenImage get intermedaiteImage =>
      const AssetGenImage('assets/images/intermedaite_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    splashScreen,
    advancedImage,
    beginerImage,
    heroImageSection,
    intermedaiteImage,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
