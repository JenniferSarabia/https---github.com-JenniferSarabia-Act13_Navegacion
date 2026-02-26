import 'package:flutter/material.dart';
import '../main.dart';

// Definimos el modelo de producto aquí también para que sea accesible
class Product {
  final String name;
  final String price;
  final String? oldPrice;
  final String imageUrl;

  const Product({
    required this.name,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
  });
}

class Pagina0 extends StatelessWidget {
  const Pagina0({super.key});

  // Datos internos de la página
  final List<Product> recentlyAdded = const [
    Product(name: "CARHARTT WIP REGULAR CARGO BLACK", price: "\$2899.00", imageUrl: "https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?q=80&w=500"),
    Product(name: "SUPREME CARGO OLIVE", price: "\$3499.00", imageUrl: "https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?q=80&w=500"),
    Product(name: "DIOR ESSENTIAL BLACK HOODIE", price: "\$7999.00", imageUrl: "https://images.unsplash.com/photo-1556821840-3a63f95609a7?q=80&w=500"),
    Product(name: "DIOR OBLIQUE GRAY HOODIE", price: "\$8499.00", imageUrl: "https://images.unsplash.com/photo-1578587018452-892bacefd3f2?q=80&w=500"),
  ];

  final List<Product> featuredProducts = const [
    Product(name: "ADIDAS FORUM LOW", price: "\$2099.00", imageUrl: "https://images.unsplash.com/photo-1552346154-21d32810aba3?q=80&w=500"),
    Product(name: "ADIDAS ESSENTIALS HOODIE", price: "\$899.00", oldPrice: "\$1199.00", imageUrl: "https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?q=80&w=500"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xFFE1E9F8),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF004691),
        foregroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, size: 30),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const Icon(Icons.storefront, color: Color(0xFF004691), size: 20),
            ),
            const SizedBox(width: 8),
            const Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("URBA Y FLOW", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16), overflow: TextOverflow.ellipsis),
                  Text("Estilo callejero", style: TextStyle(fontSize: 9)),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white, fontSize: 13),
                  decoration: InputDecoration(
                    hintText: "Buscar...",
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 13),
                    prefixIcon: Icon(Icons.search, color: Colors.white54, size: 20),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 10),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            const Text("Hola invitado", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroBanner(),
            const SectionTitle(title: "RECIÉN AGREGADOS"),
            ProductGrid(products: recentlyAdded),
            const SectionTitle(title: "DESTACADOS DEL MES"),
            ProductGrid(products: featuredProducts),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

// --- COMPONENTES AUXILIARES MOVIDOS AQUÍ ---

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  const ProductGrid({super.key, required this.products});
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final p = products[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))],
          ),
          child: Column(
            children: [
              Expanded(child: ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(15)), child: Image.network(p.imageUrl, fit: BoxFit.cover, width: double.infinity))),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10), textAlign: TextAlign.center, maxLines: 2),
                    if (p.oldPrice != null) Text(p.oldPrice!, style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 9)),
                    Text(p.price, style: const TextStyle(color: Color(0xFF004691), fontWeight: FontWeight.w900, fontSize: 13)),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(colors: [Color(0xFF005BC4), Color(0xFF67A1FF)]),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("TU ESTILO, TU FLOW", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text("Ropa urbana para destacar.", style: TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF002D5E))),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF004691),
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.all(20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("URBA Y FLOW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text("Jennifer Santos 5J", style: TextStyle(color: Colors.white70, fontSize: 10)),
        ],
      ),
    );
  }
}