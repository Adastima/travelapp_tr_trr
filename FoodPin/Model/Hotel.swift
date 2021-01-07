//
//  Hotel.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2021/1/7.
//  Copyright © 2021 NDHU_CSIE. All rights reserved.
//

import Foundation
class Hotel: NSObject, Codable {
    var name: String
    
    var location: String
    var phone: String
    var summary: String
    var image: String
    var isVisited: Bool
    var rating: String
    var website: String
    init(name: String,  location: String, phone: String, summary: String, image: String,website: String, isVisited: Bool) {
        self.name = name
        
        self.location = location
        self.phone = phone
        self.summary = summary
        self.image = image
        self.isVisited = isVisited
        self.website = website
        self.rating = ""
    }
    
    convenience override init() {
        self.init(name: "", location: "", phone: "", summary: "", image: "",website: "", isVisited: false)
    }
    
    static func generateData(sourceArray: inout [Hotel]) {
        sourceArray = [
            Hotel(name: "Hotel Villa Turka",  location: "Tophane Mah. Kargı Sk. No:7 Alanya, Alanya, 07400, Turkey", phone: "00 90 530 547 4641", summary: " A stylish hotel with comfortable rooms, wonderful home-cooking and superb views. It attracts a multi-national crew of discerning travellers who want distinctive accommodation in one of the most picturesque locations on Turkey’s Mediterranean shore.",image:"villaturka.jpg", website: "villaturka.com", isVisited: false),
            Hotel(name: "Courtyard Hotel Kalkan",  location: "Suleyman Yilmaz Cad. No 24 & 26, Kalkan, 07960, Turkey", phone: "00 90 242 844 3738", summary: " This boutique hotel nestled in a former Greek fishing village is as stylish as it is historic, serving brilliant breakfasts on a terrace with sweeping views, not to mention impromptu rooftop barbecues. ",image:"courtyard.jpg", website: "courtyardkalkan.com", isVisited: false),
            Hotel(name: "Likya Yolu Palas Hotel",  location: "Kapakli Koyu NO:44 Demre Kekova/Antalya, Kapaklı, 07570", phone: "00 90 0242 874 2222", summary: "A traditionally built property with just five bedrooms, located on a rocky hillside high above the sea, Likya Yolu Palas is an intimate place to stay. The owners will happily pass on tips for local walks, and cook up fresh Turkish fare on the roof terrace. ",image:"likya.jpg", website: "likyayolupalas.com", isVisited: false),
            Hotel(name: "Sumahan on the Water",  location: "Kuleli Cad. No:51 Cengelkoy, Istanbul, 34684, Turkey", phone: "0216 422 8000", summary: "Formerly an Ottoman-era distillery, this place was converted into an award-winning hotel by its discerning Turkish-American owners. As the hotel is situated on the Asian side of the Bosphorus Strait, guests arrive from Europe in the hotel’s own launch. There can be few finer ways to begin a visit to Istanbul.",image:"sumahan.jpg", website: "sumahan.com", isVisited: false),
            Hotel(name: "Hotel Villa Mahal",  location: "Hotel Villa Mahal, P.K.4 Kalkan, 07960 Antalya, Turkey", phone: "0242 844 3268", summary: "One of the very best boutique hotels in this beautiful corner of southwestern Turkey. Small, friendly, extremely stylish and superbly run, it’s the ideal place for a relaxing romantic break or as the base for exploring the fabulous ancient sites, gorgeously indented coastline and mountainous hinterland of Lycia.mahal",image:"mahal.jpg", website: "villamahal.com", isVisited: false),
            Hotel(name: "Georges Hotel Galata",  location: "Serdar-i Ekrem Sok No:24 Galata Beyoglu, Istanbul, 34420, Turkey", phone: "00 90 212 244 2423", summary: "The epitome of the new wave of hip boutique hotels to open in the city's old European quarter, Georges makes the most of the beautiful, 19th-century apartment building from which it is fashioned, yet knows exactly what its discerning clientele want from their accommodation in this vibrant city. ",image:"galata.jpg", website: "georges.com", isVisited: false),
            Hotel(name: "D-Maris Bay",  location: "Hisarönü Mevki, Datça Yolu 35. Km, 48380 Marmaris/Muğla, Turkey", phone: "00 90 252 441 2000", summary: "D Maris Bay’s fabulous setting, superb food and extensive facilities make it one of the best, if not the best, luxury resort on Turkey’s Turquoise Coast. Five white-sand beaches, a water ski school, indoor and outdoor pools, and a huge spa with 10 treatment rooms mean you're unlikely to be stuck for something to do.",image:"villaturka.jpg", website: "dhotel.com", isVisited: false),
            Hotel(name: "Degirmen (The Watermill)",  location: "Faralya Koyu, Hisar Mah 4, Fethiye, Turkey", phone: "0090 252 6421245", summary: "Those in search of individual accommodation, where relaxing, eating healthily and walking in spectacular mountain scenery are more important than roasting on a beach, will love Degirmen, with its stunning views, rustic rooms and a traditional Turkish restaurant. ",image:"degirmen.jpg", website: "natur-reisen.de", isVisited: false),
            Hotel(name: "Pera Palace Hotel",  location: "Meşrutiyet Caddesi 52, Tepebaşı, Beyoğlu 34430 Istanbul, Turkey", phone: "00 90 212 377 4000", summary: "They don’t come more history-filled or atmospheric than this, the hotel built by Belgian entrepreneur Georges Nagelmackers to accommodate travellers arriving on his Orient Express train from Paris. Guests here have included everyone from Ernest Hemingway and Agatha Christie to Atatürk and Greta Garbo.", image:"pera.jpg", website: "perapalace.com", isVisited: false),
            Hotel(name: "Raffles Istanbul",  location: "Zorlu Center Besiktas, Istanbul, 34340, Turkey", phone: "0090 212 924 0200", summary: "Unlike the majority of luxury hotels in Istanbul, Raffles does not pay homage to the city’s bygone Byzantine and Ottoman eras, but stands instead as a symbol of a modern, self-confident Turkey. The hotel forms part of the award-winning Zorlu Centre, which comprises an upmarket shopping centre and performance venue.", image:"raffles.jpg", website: "raffles.com", isVisited: false),
            Hotel(name: "Sabrina’s Haus",  location: "Adatepe Mevkii Bozburun, 48710 Muğla, Turkey", phone: "00 90 252 456 2045", summary: " A stylish hotel with comfortable rooms, wonderful home-cooking and superb views. It attracts a multi-national crew of discerning travellers who want distinctive accommodation in one of the most picturesque locations on Turkey’s Mediterranean shore.",image:"sabrina.jpg", website: "sabrinashaus.com", isVisited: false),
            Hotel(name: "Hillside Beach Club",  location: "Belen Cad. No:132 Kalemya Koyu, 48300 Fethiye/Muğla, Turkey", phone: "00 90 252 614 83 60", summary: "The Hillside Beach Club is a big, cheerful resort with all the workings of a small town and extensive facilities for families and couples. Its idyllic, pine-clad setting will appeal to anyone looking to kick back and relax.",image:"hillside.jpg", website: "hillsidebeachclub.com", isVisited: false),
            Hotel(name: "Tomtom Suites",  location: "Boğazkesen Caddesi. Tomtom Kaptan Sokak No.18 Beyoglu, Istanbul, 34413, Turkey", phone: "00 90 212 292 4949", summary: "Very few visitors to the exotic, 'Oriental' city of Istanbul would expect to stay in a chic hotel fashioned from a former Franciscan nunnery. But Tomtom Suites, like the city in which it is located, is full of surprises – not least because it offers great value for such stylish accommodation. ",image:"tomtom.jpg", website: "tomtomsuites.com", isVisited: false),
            Hotel(name: "Four Seasons Hotel Istanbul at Sultanahmet",  location: "Tevkifhane Sok., No:1, Sultanahmet, Istanbul, 34110, Turkey", phone: "00 90 212 638 8200", summary: "This luxurious hotel is actually fashioned from a late-Ottoman era prison once used to incarcerate writers, artists and other dissidents, though it has been so brilliantly converted you'd never guess. Its location in the heart of the city means it's a stone's throw from many of Istanbul's most famous sights.", image:"fourseason.jpg", website: "fourseasons.com", isVisited: false),
            Hotel(name: "Tuvana Hotel",  location: "Tuzcular Mah.Karanlik Sok. No:18, Antalya, 07254, Turkey", phone: "00 90 242 247 60 15", summary: "If you're seeking a calming getaway in the heart of Antalya’s old quarter, this is it. The location is a cluster of handsome Ottoman houses set around marvellous bougainvillea gardens and a swimming pool. There's a bar, a restaurant popular with locals, and breakfast, served in a pretty courtyard, feels like a treat. ", image:"tuvana.jpg", website: "tuvanahotel.com", isVisited: false),
            Hotel(name: "Romance Istanbul Hotel",  location: "Hüdavendigar Cad. No: 5 Sirkeci, Istanbul, 34110, Turkey", phone: "00 90 212 512 8676", summary: "Romance Istanbul has been transformed from a run of the mill establishment to one of the most luxurious hotels in bustling Sirkeci, right in the heart of the old city. This hotel does not pander to the hip and ephemeral but trades instead on good, old-fashioned comfort and top-quality service.", image:"romance.jpg", website: "romanceistanbulhotel.com", isVisited: false),
            Hotel(name: "Sub Karaköy",  location: " Necatibey Cad. No: 91 Karakoy, Istanbul, 34425, Turkey", phone: "00 90 212 243 0005", summary: "Karaköy has found a new lease of life as Istanbul's hippest neighbourhood. Nowhere epitomises the dramatic changes Karaköy has undergone over recent years than Sub, a self-consciously cool, yet remarkably successful hotel wrought from an anonymous 1980s office block a few streets back from the Bosphorus shoreline ", image:"karakoy.jpg", website: "subkarakoy.com", isVisited: false),
            Hotel(name: "Yasmak Sultan",  location: "Ebussuud Cadessi No:12, 34110 Istanbul, Turkey", phone: "0212 528 1343", summary: "Ideally located on the fringes of Istanbul's Sultanahmet tourist heartland, this perennially popular traditional hotel is justly renowned for its friendly and efficient staff, excellent rooftop restaurant complete with panoramic old city views, and value for money.", image:"sultan.jpg", website: "yasmakhotelcollection.com", isVisited: false),
            Hotel(name: "Hotel Unique",  location: "Karagözler Mah, Fevzi Çakmak Caddesi, Birinci Karagözler, Fethiye, Turkey", phone: "90 (0)252 612 1145", summary: "A small but perfectly formed boutique hotel with real flair, built on a difficult, steeply sloping plot opposite the marina, it exemplifies just how far Fethiye has distanced itself from the mass-market ugliness of nearby Ovacık and Hissarönü.", image:"unique.jpg", website: "hoteluniqueturkey.com", isVisited: false),
            Hotel(name: "Shangri-La Bosphorus",  location: "Sinan Pasa Mah. Hayrettin Iskelesi Sok. No:1 Besiktas, Istanbul, 34353, Turkey", phone: "00 90 212 275 8888", summary: "This abandoned former tobacco warehouse which dates back to the Roaring Twenties, has been given a vibrant lease of life as one of Istanbul's most prestigious hotels. Virtually hugging the waterfront on the European side of the historic Bosphorus Strait, the views from front rooms and the restaurant terrace are superb.", image:"bosphorus.jpg", website: "shangri-la.com", isVisited: false),
            Hotel(name: "Hotel Patara Viewpoint",  location: "Gelemiş, 07976 Kaş/Antalya, Turkey", phone: "0090 242 843 5184", summary: "The guests at this charmingly rustic hotel are mainly couples and families seeking a relaxing base from which to explore this beautiful region’s atmospheric ancient sites, walk sections of the superb Lycian Way coastal trail, or lounge on one of the Mediterranean’s longest, least crowded beaches.", image:"patara.jpg", website: "pataraviewpoint.com", isVisited: false)
            
            
            
            
            
            
            
            
        ]
    }
    
}


