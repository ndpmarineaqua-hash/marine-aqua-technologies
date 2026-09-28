import 'package:flutter/material.dart';

void main() {
  runApp(const MarineAquaApp());
}

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marine Aqua Technologies',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF3FBFD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087A9B),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

/* =========================
   COLORS
========================= */

const Color marineBlue = Color(0xFF087A9B);
const Color marineDark = Color(0xFF075B78);
const Color lightBg = Color(0xFFF3FBFD);

/* =========================
   LOGIN PAGE
   Firebase FREE
   Demo OTP = 123456
========================= */

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  bool otpSent = false;
  bool loading = false;

  void sendOtp() {
    final phone = phoneController.text.trim();

    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 10 digit mobile number'),
        ),
      );
      return;
    }

    setState(() {
      loading = true;
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;

      setState(() {
        loading = false;
        otpSent = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Demo OTP: 123456'),
        ),
      );
    });
  }

  void verifyOtp() {
    if (otpController.text.trim() == '123456') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigation(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wrong OTP. Please enter 123456'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 45),

              Image.asset(
                'assets/marine_logo.png',
                width: 260,
                height: 150,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water,
                    size: 100,
                    color: marineBlue,
                  );
                },
              ),

              const SizedBox(height: 5),

              const Text(
                'MARINE AQUA',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: marineBlue,
                  letterSpacing: 1,
                ),
              ),

              const Text(
                'TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 39,
                  fontWeight: FontWeight.w800,
                  color: marineBlue,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: marineBlue,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Smart Aquaculture. Better Results.',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.fromLTRB(28, 32, 28, 35),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: marineBlue,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      otpSent
                          ? 'Enter the OTP sent to your mobile'
                          : 'Login with your mobile number',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 25),

                    if (!otpSent)
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'Enter mobile number',
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            color: marineBlue,
                          ),
                          prefixText: '+91  ',
                          filled: true,
                          fillColor: const Color(0xFFEAF8FC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                    if (otpSent)
                      TextField(
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'Enter OTP',
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: marineBlue,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFEAF8FC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                    const SizedBox(height: 22),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: loading
                            ? null
                            : (otpSent ? verifyOtp : sendOtp),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: marineBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: loading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                otpSent ? 'VERIFY OTP' : 'SEND OTP',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),

                    if (otpSent)
                      Center(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              otpSent = false;
                              otpController.clear();
                            });
                          },
                          child: const Text(
                            'Change mobile number',
                            style: TextStyle(
                              color: marineBlue,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

/* =========================
   MAIN NAVIGATION
========================= */

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final pages = const [
    HomePage(),
    ProductsPage(),
    SupportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        height: 78,
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFFEAF0F5),
        indicatorColor: const Color(0xFFCDEFFC),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.headset_mic_outlined),
            selectedIcon: Icon(Icons.headset_mic),
            label: 'Support',
          ),
        ],
      ),
    );
  }
}

/* =========================
   HOME PAGE
========================= */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _homeHeader(),
          ),

          SliverToBoxAdapter(
            child: _heroBanner(),
          ),

          SliverToBoxAdapter(
            child: _sectionTitle(
              'ఆక్వా సమాచారం',
              Icons.arrow_forward,
            ),
          ),

          SliverToBoxAdapter(
            child: _shortcutCards(),
          ),

          SliverToBoxAdapter(
            child: _waterParameters(),
          ),

          SliverToBoxAdapter(
            child: _featuredProducts(),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 25),
          ),
        ],
      ),
    );
  }

  Widget _homeHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 18, 18, 14),
      child: Row(
        children: [
          Image.asset(
            'assets/marine_logo.png',
            width: 105,
            height: 65,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) {
              return const Icon(
                Icons.water,
                size: 55,
                color: marineBlue,
              );
            },
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: marineBlue,
                  ),
                ),
                Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: marineBlue,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: marineBlue,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.notifications_none,
            size: 32,
            color: marineBlue,
          ),
        ],
      ),
    );
  }

  Widget _heroBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          'assets/hero_banner.png',
          height: 245,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Container(
              height: 245,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFFBFEAF3),
              ),
              child: const Center(
                child: Text(
                  'MARINE AQUA TECHNOLOGIES',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 18),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: marineBlue,
              ),
            ),
          ),
          Icon(
            icon,
            size: 38,
            color: marineBlue,
          ),
        ],
      ),
    );
  }

  Widget _shortcutCards() {
    return SizedBox(
      height: 185,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          _shortcutCard(
            image: 'assets/shortcut_card_1_royyala_sagu_guide.png',
            title: 'రొయ్యల సాగు గైడ్',
          ),
          _shortcutCard(
            image: 'assets/shortcut_card_2_biomass_calculator.png',
            title: 'బయోమాస్ కాలిక్యులేటర్',
          ),
          _shortcutCard(
            image: 'assets/shortcut_card_3_royyala_vyadhulu.png',
            title: 'రొయ్యల వ్యాధులు',
          ),
        ],
      ),
    );
  }

  Widget _shortcutCard({
    required String image,
    required String title,
  }) {
    return Container(
      width: 165,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          image,
          width: 165,
          height: 185,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: marineBlue,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _waterParameters() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8FC),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFB9E5F0),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'చెరువు నీటి పరిస్థితులు',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: marineBlue,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: marineBlue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              _parameter('pH', '7.8', '6.5 - 8.5'),
              _parameter('Salinity', '18', 'ppt'),
              _parameter('DO', '5.6', 'mg/L'),
              _parameter('Alkalinity', '140', 'ppm'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _parameter(
    String name,
    String value,
    String unit,
  ) {
    return Expanded(
      child: Container(
        height: 155,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              name == 'pH'
                  ? Icons.science_outlined
                  : name == 'Salinity'
                      ? Icons.waves_outlined
                      : name == 'DO'
                          ? Icons.air
                          : Icons.biotech_outlined,
              color: const Color(0xFF1598B5),
              size: 28,
            ),
            const SizedBox(height: 7),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(h
