import 'package:flutter_test/flutter_test.dart';
import 'package:kdplayer/kdplayer.dart';
import 'package:kdplayer/kdplayer_platform_interface.dart';
import 'package:kdplayer/kdplayer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKdplayerPlatform
    with MockPlatformInterfaceMixin
    implements KdplayerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final KdplayerPlatform initialPlatform = KdplayerPlatform.instance;

  test('$MethodChannelKdplayer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKdplayer>());
  });

  test('getPlatformVersion', () async {
    Kdplayer kdplayerPlugin = Kdplayer();
    MockKdplayerPlatform fakePlatform = MockKdplayerPlatform();
    KdplayerPlatform.instance = fakePlatform;

    expect(await kdplayerPlugin.getPlatformVersion(), '42');
  });
}
