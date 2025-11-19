import 'package:flutter/material.dart';
import 'package:false9_store/models/product_entry.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  final VoidCallback onTap;

  const ProductEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

   @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          elevation: 3,
          shadowColor: Colors.black12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail section
              Stack(
                children: [
                    ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                    ),
                    child: Image.network(
                        product.thumbnail,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                        height: 180,
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.broken_image)),
                        ),
                    ),
                    ),

                    //  Category: kiri atas
                    Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                        product.category_display,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                    ),
                    ),

                    //  Badges lain: kanan atas
                    Positioned(
                    top: 10,
                    right: 10,
                    child: Row(
                        children: [
                        // Featured
                        if (product.isFeatured)
                            _badge(
                            text: "Featured",
                            bg: Colors.yellow[100]!,
                            fg: Colors.yellow[800]!,
                            ),

                        // Bestseller
                        if (product.sold > 750)
                            _badge(
                            text: "Bestseller",
                            bg: Colors.purple[100]!,
                            fg: Colors.purple[800]!,
                            ),

                        // Trending
                        if (product.view > 500)
                            _badge(
                            text: "Trending",
                            bg: Colors.red[100]!,
                            fg: Colors.red,
                            ),

                        // Stock
                        _badge(
                            text: product.stock > 0 ? "In Stock" : "Out of Stock",
                            bg: product.stock > 0 ? Colors.blue[100]! : Colors.grey[300]!,
                            fg: product.stock > 0 ? Colors.blue[800]! : Colors.grey[600]!,
                        ),
                        ],
                    ),
                    ),
                ],
                ),


              // Content area
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stats: Views - Sold - Stock
                    Row(
                      children: [
                        Icon(Icons.visibility, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text("${product.view} views",
                            style: const TextStyle(fontSize: 12)),

                        const SizedBox(width: 12),
                        Icon(Icons.shopping_bag,
                            size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text("Sold: ${product.sold}",
                            style: const TextStyle(fontSize: 12)),

                        const SizedBox(width: 12),
                        Icon(Icons.inventory_2,
                            size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text("Stock: ${product.stock}",
                            style: const TextStyle(fontSize: 12)),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Product name
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Description preview
                    Text(
                      product.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Price
                    Text(
                      "Rp ${product.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _badge({
      required String text,
      required Color bg,
      required Color fg,
      }) {
      return Container(
          margin: const EdgeInsets.only(left: 6),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
          text,
          style: TextStyle(
              color: fg,
              fontSize: 12,
              fontWeight: FontWeight.bold,
          ),
          ),
      );
  }

}