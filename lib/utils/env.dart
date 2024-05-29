import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '../portfolioMine/key.env')
abstract class Env{
  @EnviedField(varName: 'private_key',obfuscate: true)
  static String myApiKey=_Env.myApiKey;
}