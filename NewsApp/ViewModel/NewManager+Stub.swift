//
//  NewManager+stub.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/21.
//

import Foundation

extension NewsManager.Endpoint{
    var stub: Data{
        let string:String
        
        switch self{
            
        case .everything:
           string =
            """
{
            "status":"ok",
            "totalResults":57757,
            "articles":[
               {
                  "source":{
                     "id":"engadget",
                     "name":"Engadget"
                  },
                  "author":"Will Shanklin",
                  "title":"Apple Music’s dedicated classical app arrives on Android",
                  "description":"Apple Music Classical launched on Android today, bringing the company’s dedicated orchestral app to a non-Apple platform for the first time. It follows the iPhone debut of the service in March.Apple’s classical music app is separate from the mainline Apple Mu...",
                  "url":"https://www.engadget.com/apple-musics-dedicated-classical-app-arrives-on-android-175118072.html",
                  "urlToImage":"https://s.yimg.com/uu/api/res/1.2/2dFpIhi4xsIsnz3D8_QsMA--~B/Zmk9ZmlsbDtoPTYzMDtweW9mZj0wO3c9MTIwMDthcHBpZD15dGFjaHlvbg--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2023-05/dc87cb80-ff10-11ed-bebd-7fcbdea107fd.cf.jpg",
                  "publishedAt":"2023-05-30T17:51:18Z",
                  "content":"Apple Music Classical launched on Android today, bringing the companys dedicated orchestral app to a non-Apple platform for the first time. It follows the iPhone debut of the service in March.\r\nApple… [+2098 chars]"
               }
            ]
         }
"""
        case .topheadline:
            string =
            """
                    {
                        "status":"ok",
                        "totalResults":34,
                        "articles":[
                            {
                                "source":{
                                    "id":"google-news",
                                    "name":"Google News"
                                },
                                "author":"T客邦 Techbang",
                                "title":"微軟當年也推過「PC加速卡」，你可能不知道的微軟80年代硬體產品 - T客邦 Techbang",
                                "description":null,
                                "url":"https://news.google.com/rss/articles/CBMiYGh0dHBzOi8vd3d3LnRlY2hiYW5nLmNvbS9wb3N0cy8xMDczMDEtbWljcm9zb2Z0LTgwcy1oYXJkd2FyZS15b3UtbWF5LW5vdC1rbm93LWlibS1wYy1wZXJmb3JtYW5jZdIBZGh0dHBzOi8vd3d3LnRlY2hiYW5nLmNvbS9wb3N0cy8xMDczMDEtbWljcm9zb2Z0LTgwcy1oYXJkd2FyZS15b3UtbWF5LW5vdC1rbm93LWlibS1wYy1wZXJmb3JtYW5jZS5hbXA?oc=5",
                                "urlToImage":null,
                                "publishedAt":"2023-06-26T06:30:00Z",
                                "content":null
                            },
                            {
                                "source":{
                                    "id":"google-news",
                                    "name":"Google News"
                                },
                                "author":"Yahoo奇摩運動",
                                "title":"莊淑貞醫師談牙齦病因及治療 - Yahoo奇摩運動",
                                "description":null,
                                "url":"https://news.google.com/rss/articles/CBMipQFodHRwczovL3R3LnNwb3J0cy55YWhvby5jb20vbmV3cy8lRTglOEUlOEElRTYlQjclOTElRTglQjIlOUUlRTklODYlQUIlRTUlQjglQUIlRTglQUIlODclRTclODklOTklRTklQkQlQTYlRTclOTclODUlRTUlOUIlQTAlRTUlOEYlOEElRTYlQjIlQkIlRTclOTklODItMDU1OTAwMDUyLmh0bWzSAa0BaHR0cHM6Ly90dy5zcG9ydHMueWFob28uY29tL2FtcGh0bWwvbmV3cy8lRTglOEUlOEElRTYlQjclOTElRTglQjIlOUUlRTklODYlQUIlRTUlQjglQUIlRTglQUIlODclRTclODklOTklRTklQkQlQTYlRTclOTclODUlRTUlOUIlQTAlRTUlOEYlOEElRTYlQjIlQkIlRTclOTklODItMDU1OTAwMDUyLmh0bWw?oc=5",
                                "urlToImage":null,
                                "publishedAt":"2023-06-26T06:11:43Z",
                                "content":null
                            },
                            {
                                "source":{
                                    "id":"google-news",
                                    "name":"Google News"
                                },
                                "author":"ETtoday新聞雲",
                                "title":"快訊／網提案「周休三日」被打槍 行政院人事總處：不予參採 - ETtoday新聞雲",
                                "description":null,
                                "url":"https://news.google.com/rss/articles/CBMiMWh0dHBzOi8vd3d3LmV0dG9kYXkubmV0L25ld3MvMjAyMzA2MjYvMjUyNzM2NS5odG3SATlodHRwczovL3d3dy5ldHRvZGF5Lm5ldC9hbXAvYW1wX25ld3MucGhwNz9uZXdzX2lkPTI1MjczNjU?oc=5",
                                "urlToImage":null,
                                "publishedAt":"2023-06-26T05:38:00Z",
                                "content":null
                            },
                            {
                                "source":{
                                    "id":"google-news",
                                    "name":"Google News"
                                },
                                "author":"三立新聞網 Setn.com",
                                "title":"表態了！上週才同台郭台銘 南投縣長許淑華：我當然支持侯友宜侯啊 - 三立新聞網 Setn.com",
                                "description":null,
                                "url":"https://news.google.com/rss/articles/CBMiLWh0dHBzOi8vd3d3LnNldG4uY29tL05ld3MuYXNweD9OZXdzSUQ9MTMxNDM5NdIBMmh0dHBzOi8vd3d3LnNldG4uY29tL20vYW1wbmV3cy5hc3B4P05ld3NJRD0xMzE0Mzk1?oc=5",
                                "urlToImage":null,
                                "publishedAt":"2023-06-26T04:53:00Z",
                                "content":null
                            },
                            {
                                "source":{
                                    "id":"google-news",
                                    "name":"Google News"
                                },
                                "author":"方格子",
                                "title":"育兒好物｜外出必備【大地之愛】USDA有機嬰幼兒防蚊液｜媺媺嫚嫚&大腸粉腸-雙胞媽 - 方格子 - 方格子",
                                "description":null,
                                "url":"https://news.google.com/rss/articles/CBMiMWh0dHBzOi8vdm9jdXMuY2MvYXJ0aWNsZS82NDk0N2ZkNGZkODk3ODAwMDE3Mjc4NTnSATVodHRwczovL3ZvY3VzLmNjL2FydGljbGUvYW1wLzY0OTQ3ZmQ0ZmQ4OTc4MDAwMTcyNzg1OQ?oc=5",
                                "urlToImage":null,
                                "publishedAt":"2023-06-26T04:44:13Z",
                                "content":null
                            }
                        ]
                    }
                    """
            
        }
        return Data(string.removingAllWhitespace.utf8)
    }
}
