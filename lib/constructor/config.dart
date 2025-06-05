import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';
import 'models.dart';



GAPage gaPage_main = GAPage(
    id: 1,
    pageTitle: "главная",
    pageIcon: Icons.ac_unit,
    widgets: [
        gaWidget1,
        gaWidget2,
        gaWidget3
    ]
);

GymAppConstructorRules GACRules = GymAppConstructorRules(
    name: "МОЙ ФИТНЕС КЛУБ",
    navBarType: 1,
    colorScheme: FlexScheme.espresso,
    textTheme: GoogleFonts.unboundedTextTheme(),
    pages: {
      'main': gaPage_main
    },
);