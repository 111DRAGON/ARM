import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_toast.dart';

abstract class UrlServices{
  static launchLink(String url)async{
    if(!(url.startsWith('https://'))){
      url = 'https://$url';
    }

    Uri uri = Uri.parse(url);
    try{
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    }
    catch (e){
      await customToast('حدث خطأ اثناء تحميل الرابط', ToastStatus.warning);
    }
  }

  static makeCall(String phoneNumber)async{
    Uri uri = Uri.parse('tel:$phoneNumber');
    try{
      await launchUrl(uri);
    }
    catch (e){
      await customToast('حدث خطأ', ToastStatus.warning);
    }
  }

  static launchGoogleMaps({required double latitude,required double longitude,})async{

    Uri uri = Uri.parse('https://maps.google.com/?q=$latitude,$longitude');
    try{
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    }
    catch (e){
      await customToast('حدث خطأ اثناء تحميل الرابط', ToastStatus.warning);
    }
  }

  static launchWhatsApp(String phoneNumber)async{
    if(!(phoneNumber.startsWith('+2'))){
      phoneNumber = '+2$phoneNumber';
    }
    Uri uri = Uri.parse('https://wa.me/$phoneNumber');
    try{
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    }
    catch (e){
      await customToast('حدث خطأ اثناء تحميل الرابط', ToastStatus.warning);
    }
  }
}