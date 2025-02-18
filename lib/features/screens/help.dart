import 'package:url_launcher/url_launcher_string.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  HelpScreen();
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> with SingleTickerProviderStateMixin {
  TextStyle helpTitleText = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  TextStyle helpText = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Europa',
  );

  TextStyle hyperlinkText = TextStyle(
    color: Color.fromARGB(255, 26, 13, 127),
    fontSize: 16,
    fontFamily: 'Europa',
  );

  SizedBox paragraphMarginTop = SizedBox(height: 10);

  SizedBox sectionMarginTop = SizedBox(height: 30);

  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Help',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/peepl-skydiving-2-300dpi.jpeg'),
              Text(
                  'We are in the early stages of building the Peepl Eat Experience, so might be some teething issues, apologies if you are facing some!',
                  style: helpText),
              paragraphMarginTop,
              Text(
                  'We are trying to build Peepl carefully and consciously to help local entrepreneurs and people, bring the power back to local communities.',
                  style: helpText),
              paragraphMarginTop,
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'There are answers to some common questions below. For anything else, email us at ',
                    style: helpText),
                TextSpan(
                    text: "help@itsaboutpeepl.com",
                    style: hyperlinkText,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        var url = "mailto:help@itsaboutpeepl.com";
                        if (await canLaunchUrlString(url)) {
                          await launchUrlString(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                TextSpan(text: ".", style: helpText)
              ])),
              sectionMarginTop,
              Text(
                'How do I pay?',
                style: helpTitleText,
              ),
              paragraphMarginTop,
              Text(
                  'We are using Stripe, one of the most trusted payment processors in the world. To top up, just tap “Home”, then the menu icon, then “Top up” to add money to your wallet, straight from your credit or debit card.',
                  style: helpText),
              sectionMarginTop,
              Text('My card is not accepted or topping up is not working for me.', style: helpTitleText),
              paragraphMarginTop,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "If this is the case, please contact us at ", style: helpText),
                    TextSpan(
                        text: "help@itsaboutpeepl.com",
                        style: hyperlinkText,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url = "mailto:help@itsaboutpeepl.com";
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }),
                    TextSpan(
                        text: " and we’ll help you top up your wallet with a transfer via your bank’s app or website.",
                        style: helpText)
                  ],
                ),
              ),
              sectionMarginTop,
              Text(
                'Where can I see my past orders?',
                style: helpTitleText,
              ),
              paragraphMarginTop,
              Text('Your past orders are shown by heading to ‘orders’ at the top of the ‘Orders’ tab on the app.',
                  style: helpText),
              sectionMarginTop,
              Text("My order hasn't turned up", style: helpTitleText),
              paragraphMarginTop,
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text:
                          "The quickest way to resolve issues with your order is by contacting the restaurant you ordered from, directly. Their phone number is included on the confirmation email we sent you when you ordered. If you don’t get anywhere with that, or you’ve lost your confirmation email, then contact us at ",
                      style: helpText),
                  TextSpan(
                      text: "help@itsaboutpeepl.com",
                      style: hyperlinkText,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var url = "mailto:help@itsaboutpeepl.com";
                          if (await canLaunchUrlString(url)) {
                            await launchUrlString(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                  TextSpan(text: " and we’ll do our best to put you in touch with the venue.", style: helpText)
                ],
              )),
              sectionMarginTop,
              Text(
                'What is this PPL thing in my wallet?',
                style: helpTitleText,
              ),
              paragraphMarginTop,
              Text(
                  'PPL are reward points – your local restaurants’ way of saying thank you for spending locally. Right now you can only collect PPL, but eventually you’ll be able to spend them within the app, at a rate of 1000 PPL per £1.',
                  style: helpText),
              sectionMarginTop,
              Text(
                'Do you treat your riders fairly?',
                style: helpTitleText,
              ),
              paragraphMarginTop,
              Text(
                  'We’re partnered with Agile Liverpool for zero-carbon delivery. Our riders are all on proper working contracts, being paid above the standard living wage in the UK. We feel very strongly that this should be the case for all delivery riders and other individuals with similar working situations.',
                  style: helpText),
              sectionMarginTop,
              Text("Who are you?", style: helpTitleText),
              paragraphMarginTop,
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text:
                          "We’re a group of scousers with a vision for creating a fairer, more inclusive local economy. We want to stop money leaving the city region, going to banks and silicon valley monopolies, and instead reinvest that money into the businesses and people that make the Liverpool City Region so special. You can find out more at ",
                      style: helpText),
                  TextSpan(
                      text: "itsaboutpeepl.com.",
                      style: hyperlinkText,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var url = "http://itsaboutpeepl.com";
                          if (await canLaunchUrlString(url)) {
                            await launchUrlString(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                ],
              )),
              sectionMarginTop,
              Text("What information do you store about me?", style: helpTitleText),
              paragraphMarginTop,
              Text(
                  "When you provide your email address, phone number, and delivery address as part of your order, we store those details so that we can send them to the relevant restaurant and our delivery partners for delivery of your order. We also store your Peepl wallet ID, so that can match up your order with your payment.",
                  style: helpText),
              paragraphMarginTop,
              Text(
                  "If you choose to opt-out of marketing communications, we will only store information relevant for individual order delivery such as mentioned above. If you choose to receive marketing communications from us, we currently share this with a third party whilst building the capability to do this without our own app ecosystem.",
                  style: helpText),
              paragraphMarginTop,
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text:
                          "Your personal information may be shared with trusted third parties, such as Stripe (in order to process your card payment when topping up your wallet), Twilio (in order to send SMS delivery notifications), and Mailchimp (in order to send email confirmations). ",
                      style: helpText),
                  TextSpan(
                      text: "You can read more about how we protect your personal information here.",
                      style: hyperlinkText,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var url = "https://itsaboutpeepl.com/privacy";
                          if (await canLaunchUrlString(url)) {
                            await launchUrlString(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                ],
              )),
              paragraphMarginTop,
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text:
                          "You can contact us at any time to ask for a copy of all data we hold about you, or to remove all data we hold about you. Just email ",
                      style: helpText),
                  TextSpan(
                      text: "help@itsaboutpeepl.com.",
                      style: hyperlinkText,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var url = "mailto:help@itsaboutpeepl.com";
                          if (await canLaunchUrlString(url)) {
                            await launchUrlString(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                ],
              )),
              sectionMarginTop,
              Text("Can I list my own business on Peepl?", style: helpTitleText),
              paragraphMarginTop,
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text:
                        "We’re rolling out Peepl very carefully at the moment, and working with a small number of partners to make sure the experience is just right. But if you’re interested in joining our pilot, email ",
                    style: helpText),
                TextSpan(
                    text: "help@itsaboutpeepl.com.",
                    style: hyperlinkText,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        var url = "mailto:help@itsaboutpeepl.com";
                        if (await canLaunchUrlString(url)) {
                          await launchUrlString(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
              ])),
              sectionMarginTop,
              Text("Something doesn't seem right, how can I send you feedback?", style: helpTitleText),
              paragraphMarginTop,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Email us at ", style: helpText),
                    TextSpan(
                        text: "help@itsaboutpeepl.com",
                        style: hyperlinkText,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url = "mailto:help@itsaboutpeepl.com";
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }),
                    // paragraphMarginTop,
                    // TextSpan(
                    //     text: ". You can join our group on Telegram by ",
                    //     style: helpText),
                    // TextSpan(
                    //     text: "clicking here.",
                    //     style: hyperlinkText,
                    //     recognizer: TapGestureRecognizer()
                    //       ..onTap = () async {
                    //         var url = "https://t.me/peeplnetwork";
                    //         if (await canLaunch(url)) {
                    //           await launch(url);
                    //         } else {
                    //           throw 'Could not launch $url';
                    //         }
                    //       })
                  ],
                ),
              ),
              sectionMarginTop,
            ],
          ),
        ),
      ),
    );
  }
}
