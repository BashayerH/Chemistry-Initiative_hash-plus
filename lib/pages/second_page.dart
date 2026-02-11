import 'package:flutter/material.dart';
import 'home_page.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBrown = Color(0xFF5C4033); // بني غامق

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 الصورة الكبيرة
            Container(
              height: 260,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/download (9).jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// 🔹 المحتوى
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  textDirection: TextDirection.rtl,
                  children: [
                    /// السؤال مباشرة تحت الصورة
                    const SizedBox(height: 15),
                    Text(
                      "هل تساءلت يوماً لماذا تتلألأ السماء بألوان الشفق القطبي؟",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: darkBrown,
                        fontFamily: 'Cairo', // خط مرتب وجميل
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// الشرح العلمي بالعربي
                    const Text(
                      "الشفق القطبي يحدث عندما تصطدم جسيمات مشحونة من الشمس بالغازات في الغلاف الجوي للأرض، مثل الأكسجين والنيتروجين. هذه الاصطدامات تثير الذرات والجزيئات وتمنحها طاقة إضافية.\n"
                      "• الأكسجين على ارتفاع منخفض يعطي ضوءاً أخضر\n"
                      "• الأكسجين على ارتفاع مرتفع يعطي ضوءاً أحمر\n"
                      "• النيتروجين يعطي ألوان زرقاء وبنفسجية\n\n"
                      "عندما تعود هذه الذرات إلى حالتها الطبيعية، تطلق الطاقة على شكل ضوء مرئي. هذه العملية هي سبب الألوان المذهلة للشفق، وهي مثال حي على تفاعل كيميائي وفيزيائي طبيعي يمكن ملاحظته في حياتنا اليومية.",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),

                    const Spacer(),

                    /// 🔹 الأزرار متساوية الحجم ومرفوعة شوي
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        children: [
                          /// زر العودة (نص بني، خلفية أبيض مع حدود بنية، أيقونة بعد النص)
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(color: darkBrown),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "العودة للصفحة الرئيسية",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: darkBrown,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(Icons.home, size: 20, color: darkBrown),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(width: 15),

                          /// زر البوك مارك (نص أبيض، خلفية بني غامق، أيقونة بعد النص)
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: darkBrown,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("تم الإضافة إلى المفضلة"),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "إضافة إلى المفضلة",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(
                                    Icons.bookmark,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
