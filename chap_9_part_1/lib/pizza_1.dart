class Pizza {
 final int id;
 final String pizzaName;
 final String description;
 final double price;
 final String imageUrl;


  Pizza.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        pizzaName = json['pizzaName'],
        description = json['description'],
        price = json['price'],
        imageUrl = json['imageUrl'];
}
/*
ফ্লাটার (Flutter) ফ্রেমওয়ার্কের ব্যবহার করে জাভাস্ক্রিপ্ট অনুযায়ী ডেটা পার্স করার জন্য ব্যবহৃত হয়। এই ব্লকে একটি ক্লাস ডিফাইন করা হয়, যা নিউমেরিক এবং স্ট্রিং টাইপের পারামিটার নিয়ে নিতে পারে। নিচে প্রতিটি লাইনের কাজ এবং বিস্তারিত বর্ণনা দেওয়া হল:

class Pizza {: এই লাইনে একটি ক্লাস ডিফাইন হচ্ছে, যা Pizza নামে ধারণ করা হয়েছে।

final int id;, final String pizzaName;, final String description;, final double price;, final String imageUrl;: এই লাইনগুলিতে ক্লাসের প্রপার্টিগুলির ডেক্লেয়ারেশন হচ্ছে। এগুলির মান একবার সেট করা হয় এবং পরে পরিবর্তন করা যায় না (কারণ final ব্যবহার করা হয়েছে)।

Pizza.fromJson(Map<String, dynamic> json): এটি একটি কনস্ট্রাক্টর যা একটি ম্যাপ ডেটা (JSON ফরম্যাটে) থেকে পিজ্জা অবজেক্ট তৈরি করতে ব্যবহৃত হয়।

: id = json['id'],: এটি কনস্ট্রাক্টরের বডির অংশের একটি লাইন, যেখানে id প্রপার্টির মান JSON অবজেক্টের 'id' কীতে থাকা থেকে সেট হচ্ছে।

pizzaName = json['pizzaName'], description = json['description'], price = json['price'], imageUrl = json['imageUrl'];: এই লাইনগুলি প্রপার্টিগুলির মান সেট করে, যেগুলি পারস করা JSON অবজেক্টের বিভিন্ন কী থেকে নেওয়া হয়।

এই কোড ব্লক দ্বারা একটি Pizza ক্লাস ডিফাইন করা হয়েছে যা JSON থেকে ডেটা পার্স করে একটি পিজ্জা অবজেক্ট তৈরি করে। এই অবজেক্টের মৌলিক প্রপার্টিগুলি হলো id, pizzaName, description, price, এবং imageUrl।

*/