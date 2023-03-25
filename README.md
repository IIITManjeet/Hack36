<h1 align="center">Hack36</h1>
<p align="center">
</p>

<a href="https://hack36.com"> <img src="https://i.postimg.cc/RFFWF4vg/built-at-hack.jpg" height=24px> </a>

## Introduction:
  As we all know, the health status of many is getting worst due to work stress and anxiety. Depression has become the biggest problem for people. Most of the youth responsible for the growth of a country are crippled in the chains of depression and anxiety, thus slowing down developmental activities. Sadly, the problem is suffered by many yet not discussed openly. So here we the team "Ideavengers" bring a caretaker "CARESS" for all of them who suffer from the same but hesitate to tell.
  
## Demo Video Link:
  <a href="https://youtu.be/bY5PYbtST8I">Video Link</a>
  
## Presentation Link:
  <a href="https://docs.google.com/presentation/d/1lsCcY13nABYehES-XKVbDkrTb3gBQ8MC/edit?usp=drivesdk&ouid=111122854190715549277&rtpof=true&sd=true"> PPT link here </a>
  
  
# Table of Contents:

## Technology Stack:
  1) Flutter
  2) Dart
  3) Firebase
  4) Flask API
  5) Google Fit API
  6) NewsAPI
  7) scikit-learn
  8) Pandas
  

## Contributors:

Team Name: Ideavengers

* [Pranjal Dubey](https://github.com/dubey2709)
* [Manjeet Pathak](https://github.com/IIITManjeet)
* [Vinay Kumar](https://github.com/vink08)

# Caress
## Theme - Mental Health




### Note - This app is currently in test mode and only users allowed by the admin who have a google account can use the app properly. The two possible publishing modes of the app are given below<br>

Publishing Status ( Important )<br>
<li>In Production:
Once you set your app status as "In production," your app will be available to anyone with a Google Account. Depending on how you configure your OAuth screen, you may have to submit your app for verification .<br>
<li>Testing:
If your app is still being tested and built, you can set your status to "testing". In this state, you can test your app with a limited number of users.<br>
Courtesy - https://console.cloud.google.com/apis


## Functioning and User Flow
1. Firstly the user sign up and login in the application.<br>
2. Basic Information of user, his friend/well wisher/guardian or any specialist doctor is taken for future use and profile display.<br>
3. Instructions are given to connect the app with the smart watch.<br>
4. After submitting the details and setting up the watch with app, the application ask for various permissions such as track activity, phone usage and personalized    google account permissions<br>
5. As soon as you give your google account access, data of your current vitals is shown on the screen which is updated after every 2 minutes.<br>
6. If there is a spike in the heart rate(>100), user recieves an alert notification.The alert notification suggests you to stop using an particular app(correctly 70% of the time) and provides you the facility to call your friend on a single tap. Also an email about the same is delivered to the friend/well wisher or specialist whose information was collected previously.Emails are sent after a duration of 3 hours only.<br>
7. Application also consists of articles page(contains articles related to mental health) and profile page which consits the data of user which can be updated frequently.<br>
8. Application also provides you with facility of self assessment of various mental health disorders such as Depression, PTSD, schizophrenia, addiction and anxiety. After taking the self assessment tests the results are shared with the specialist/doctor via an email.
9. Helpline page is there in the application which includes helpline numbers and website links of 11 mental health healing websites for support. Call to any organisation can be just made by a single tap on the contact tile.
10. One differentiating feature of the app is the smart stress analysis which works on a backend based ML model integrated using flask REST API. This smart stress analysis takes two inputs which is body temperature and no of steps you walked in past 30 minutes and based on these values and dataset which we are using in the backend, Application determines the probability level of stress you are having.



# App Screenshots

<img src = "https://user-images.githubusercontent.com/110723566/227720701-55bf16ab-92ee-417f-85ee-d0f18c8e4116.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720703-8c39579a-e315-4946-a2e1-8e13ee7d063b.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720702-7a45c2d6-fcc3-45d6-9cd1-c62dd00acde6.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720705-1889b381-0c0a-4f79-9a25-55b83cc706b2.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720707-82e95ca4-c8da-486e-ae69-d227de1558a9.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720706-4fc9cd03-ef06-4c2d-8f45-4eb18996f68d.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720710-e40d33bb-c757-4aba-9959-a3a8a8010f86.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720728-9167660a-c6bf-4a01-b3f9-7a481b4a476b.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720709-c07399a9-d1c5-4810-b80c-0818c4a5621b.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720712-fd8fb8cf-3fd0-4264-9e23-c156c97ee4f8.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720713-f7f345d9-4997-46dc-99f1-2a1f54bed3e6.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720714-faa7a593-bdbc-492e-b3da-8231c0d239ab.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720716-4dc8f813-4d0a-4cf1-aa07-cdf25103ebe0.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720718-31d62917-d207-441f-ab65-45fa7511edd5.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720720-5c193be7-f2da-4502-ac17-fd7bb96993ca.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720719-f5097731-19f3-4845-be93-11c06ad625c9.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720723-6b76dfd3-6adc-489a-aa9c-22124bc50908.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720724-c23079ab-752a-4e60-9a94-ca38a3931ceb.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720727-5901d113-3f19-49ce-ba9c-b289a044a4ad.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720725-39e2d2b2-6bcf-45fc-bf44-7a2a1db30959.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720731-3594326f-9cec-43c7-bc4f-4cd720286e12.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720733-534c419c-8bc2-4666-98e9-c70fc455a183.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720735-3e59338b-fa90-4ddc-9c65-ce97127ee5f1.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720737-b58afdc0-acf5-455f-896e-cdfff060bea2.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720739-c375f9d1-8a58-4a98-b893-f50bb839dff7.jpeg" width = 200></img>&nbsp;
<img src = "https://user-images.githubusercontent.com/110723566/227720742-7f46c1a6-b583-4583-b75f-83c97a13bb4c.jpeg" width = 200></img>&nbsp;


## Flutter dependecies used :
  cupertino_icons: ^1.0.2<br>
  permission_handler: ^10.2.0<br>
  health: ">=4.4.0 <5.0.0"<br>
  firebase_auth: ">=4.2.8 <4.2.9"<br>
  firebase_core: ^2.7.0<br>
  cloud_firestore: ^4.4.3<br>
  shared_preferences: ^2.0.18<br>
  flutter_local_notifications: ^13.0.0<br>
  firebase_messaging: ^14.2.5<br>
  timezone: ^0.9.1<br>
  persistent_bottom_nav_bar: ^5.0.2<br>
  image_picker: ^0.8.7<br>
  firebase_storage: ^11.0.16<br>
  http: ^0.13.5<br>
  url_launcher: ^6.1.10<br>
  usage_stats: ^1.2.0<br>
  flutter_phone_direct_caller: ^2.1.1<br>
  email_validator: '^2.1.16'<br>
  intro_screen_onboarding_flutter: ^1.0.0<br>
  intl: ^0.17.0<br>
  percent_indicator: ^4.2.3<br>
  font_awesome_flutter: ^10.4.0<br>

### Made at:
<a href="https://hack36.com"> <img src="https://i.postimg.cc/RFFWF4vg/built-at-hack.jpg" height=24px> </a>


 

