local init = require("assets.songs._init")

local ext = ".mp3"
local path = "/assets/songs/"
init.initFiles(ext, false)

local tags = {
    All_Your_n = {
        TIME = {"2019"},
        GENRE = {"bluegrass", "country", "folk"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {},
        VIBES = {"love", "cozy", "happy", "upbeat"},
        METRICS = {
            BPM = "78",
            KEY = "B",
            TIME_SIG = "4/4"
        }
    },
    As_Long_as_I_ve_Got_You = {
        TIME = {"1967"},
        GENRE = {"RnB", "soul pop", "doo wop", "soul"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"oldies", "ballads"},
        VIBES = {"chill", "happy", "easy", "love"},
        METRICS = {
            BPM = "86",
            KEY = "Fsharp/Gflat",
            TIME_SIG = "4/4"
        }
    },
    At_Last = {
        TIME = {"1960"},
        GENRE = {"RnB", "soul", "jazz", "blues"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"oldies", "ballads"},
        VIBES = {"easy", "happy", "love", "iconic"},
        METRICS = {
            BPM = "87",
            KEY = "F",
            TIME_SIG = "3/4"
        }
    },
    BIRDS_OF_A_FEATHER = {
        TIME = {"2024"},
        GENRE = {"RnB", "pop", "contemporary"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"queer", "lesbian", "contemporary"},
        VIBES = {"chill", "love", "soft"},
        METRICS = {
            BPM = "105",
            KEY = "D",
            TIME_SIG = "4/4"
        }
    },
    Badfish = {
        TIME = {"1992"},
        GENRE = {"reggae", "ska"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"throwback"},
        VIBES = {"chill", "happy", "stoner"},
        METRICS = {
            BPM = "93",
            KEY = "D",
            TIME_SIG = "4/4"
        }
    },
    Bodyguard = {
        TIME = {"2024"},
        GENRE = {"pop", "country", "soft rock"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"contemporary"},
        VIBES = {"love", "dance"},
        METRICS = {
            BPM = "119",
            KEY = "E",
            TIME_SIG = "4/4"
        }
    },
    Bring_It_On_Home_to_Me = {
        TIME = {"1963"},
        GENRE = {"RnB", "soul"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"oldies"},
        VIBES = {"sway", "love", "easy"},
        METRICS = {
            BPM = "71",
            KEY = "C",
            TIME_SIG = "4/4"
        }
    },
    Closer_to_the_Sun = {
        TIME = {"2005"},
        GENRE = {"reggae"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {},
        VIBES = {"chill", "easy", "stoner"},
        METRICS = {
            BPM = "75",
            KEY = "G",
            TIME_SIG = "4/4"
        }
    },
    Coming_Home = {
        TIME = {"2015"},
        GENRE = {"soul", "neo soul", "RnB"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"ballad"},
        VIBES = {"sway", "love"},
        METRICS = {
            BPM = "112",
            KEY = "Fsharp/Gflat",
            TIME_SIG = "3/4"
        }
    },
    Cruisin = {
        TIME = {"1979"},
        GENRE = {"RnB", "soul"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"oldies"},
        VIBES = {"chill", "happy", "love", "iconic"},
        METRICS = {
            BPM = "169",
            KEY = "Fsharp/Gflat",
            TIME_SIG = "4/4"
        }
    },
    Dog_Butterfly = {
        TIME = {"1978"},
        GENRE = {"rock"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"classics"},
        VIBES = {"ballad", "soft"},
        METRICS = {
            BPM = "125",
            KEY = "E",
            TIME_SIG = "4/4"
        }
    },
    Dolly = {
        TIME = {"2021"},
        GENRE = {"pop", "hip-hop"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"contemporary"},
        VIBES = {"soft", "chill"},
        METRICS = {
            BPM = "90",
            KEY = "D",
            TIME_SIG = "4/4"
        }
    },
    Georgia_On_My_Mind = {
        TIME = {"1960"},
        GENRE = {"jazz", "RnB", "soul", "orchestral"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"oldies"},
        VIBES = {"sway", "chill", "iconic"},
        METRICS = {
            BPM = "94",
            KEY = "G",
            TIME_SIG = "4/4"
        }
    },
    Greens = {
        TIME = {"2018"},
        GENRE = {"pop"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"queer", "deep cuts"},
        VIBES = {"love", "chill"},
        METRICS = {
            BPM = "78",
            KEY = "B",
            TIME_SIG = "4/4"
        }
    },
    Hoyt_And_Schermerhorn = {
        TIME = {"2018"},
        GENRE = {"rap"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {},
        VIBES = {"love", "happy"},
        METRICS = {
            BPM = "170",
            KEY = "Cshard/Dflat",
            TIME_SIG = "4/4"
        }
    },
    LOVE = {
        TIME = {"2017"},
        GENRE = {"rap", "hip hop", "RnB"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"contemporary"},
        VIBES = {"sway", "chill", "love"},
        METRICS = {
            BPM = "126",
            KEY = "Asharp/Bflat",
            TIME_SIG = "4/4"
        }
    },
    Lean_on_Me = {
        TIME = {"1972"},
        GENRE = {"RnB", "soul"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"oldies"},
        VIBES = {"happy", "easy", "upbeat", "sway"},
        METRICS = {
            BPM = "75",
            KEY = "C",
            TIME_SIG = "4/4"
        }
    },
    Lets_Stay_Together = {
        TIME = {"1972"},
        GENRE = {"RnB", "soul", "soul pop"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"oldies"},
        VIBES = {"happy", "love", "chill", "easy"},
        METRICS = {
            BPM = "102",
            KEY = "G",
            TIME_SIG = "4/4"
        }
    },
    Loud = {
        TIME = {"2020"},
        GENRE = {"pop", "indie"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"deep cuts"},
        VIBES = {"sexy"},
        METRICS = {
            BPM = "121",
            KEY = "E",
            TIME_SIG = "4/4"
        }
    },
    Love_Me_Right = {
        TIME = {"1960"},
        GENRE = {"RnB", "blues"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"oldies", "deep cuts"},
        VIBES = {"sexy", "dance"},
        METRICS = {
            BPM = "146",
            KEY = "Csharp/Dflat",
            TIME_SIG = "4/4"
        }
    },
    Love_You_For_A_Long_Time = {
        TIME = {"2023"},
        GENRE = {"indie"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"contemporary"},
        VIBES = {"happy", "love", "upbeat"},
        METRICS = {
            BPM = "113",
            KEY = "A",
            TIME_SIG = "4/4"
        }
    },
    Low_Rider = {
        TIME = {"1975"},
        GENRE = {"funk", "funk rock"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"classics"},
        VIBES = {"stoner", "happy", "easy", "iconic"},
        METRICS = {
            BPM = "140",
            KEY = "C",
            TIME_SIG = "4/4"
        }
    },
    Our_House_demo = {
        TIME = {"1970"},
        GENRE = {"folk", "folk rock"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {},
        VIBES = {"soft", "love"},
        METRICS = {
            BPM = "158",
            KEY = "C",
            TIME_SIG = "4/4"
        }
    },
    Proud_Mary = {
        TIME = {"1970"},
        GENRE = {"soul", "rock", "funk rock"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"classics"},
        VIBES = {"iconic", "upbeat", "drops"},
        METRICS = {
            BPM = "171",
            KEY = "D",
            TIME_SIG = "4/4"
        }
    },
    Pussy_Is_God = {
        TIME = {"2018"},
        GENRE = {"pop", "electropop"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"queer", "lesbian"},
        VIBES = {"sexy"},
        METRICS = {
            BPM = "86",
            KEY = "B",
            TIME_SIG = "4/4"
        }
    },
    Red_Wine_Supernova = {
        TIME = {"2023"},
        GENRE = {"pop", "synthpop"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"queer", "lesbian"},
        VIBES = {"upbeat", "sexy", "happy", "dance"},
        METRICS = {
            BPM = "124",
            KEY = "A",
            TIME_SIG = "4/4"
        }
    },
    Sand_Dollars = {
        TIME = {"2014"},
        GENRE = {"alt rock", "reggae rock"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = { },
        VIBES = {"chill", "stoner"},
        METRICS = {
            BPM = "172",
            KEY = "C",
            TIME_SIG = "4/4"
        }
    },
    Sittin_On_the_Dock_of_the_Bay = {
        TIME = {"1967"},
        GENRE = {"soul", "RnB", "folk pop"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"oldies"},
        VIBES = {"chill", "iconic", "sad"},
        METRICS = {
            BPM = "104",
            KEY = "D",
            TIME_SIG = "4/4"
        }
    },
    So_Hot_Youre_Hurting_My_Feelings = {
        TIME = {"2019"},
        GENRE = {"alt", "indie"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"contemporary"},
        VIBES = {"dance", "sexy"},
        METRICS = {
            BPM = "112",
            KEY = "Fsharp/Gflat",
            TIME_SIG = "4/4"
        }
    },
    Stay_High = {
        TIME = {"2019"},
        GENRE = {"RnB", "alt rock", "neo soul"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"queer"},
        VIBES = {"sexy", "sway", "love", "stoner"},
        METRICS = {
            BPM = "122",
            KEY = "A",
            TIME_SIG = "4/4"
        }
    },
    Stranger = {
        TIME = {"2020"},
        GENRE = {"country", "folk", "country pop"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"queer", "gay"},
        VIBES = {"chill"},
        METRICS = {
            BPM = "81",
            KEY = "Gsharp/Aflat",
            TIME_SIG = "4/4"
        }
    },
    Stranger_At_My_Door = {
        TIME = {"1967"},
        GENRE = {"RnB", "soul"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"oldies"},
        VIBES = {"sad", "breakup"},
        METRICS = {
            BPM = "92",
            KEY = "C",
            TIME_SIG = "4/4"
        }
    },
    Sunflower = {
        TIME = {"2018"},
        GENRE = {"dream pop", "synthpop", "alt RnB"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {},
        VIBES = {"chill"},
        METRICS = {
            BPM = "90",
            KEY = "D",
            TIME_SIG = "4/4"
        }
    },
    Sweet_Nothing = {
        TIME = {"2022"},
        GENRE = {"pop"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {},
        VIBES = {"love", "chill", "soft"},
        METRICS = {
            BPM = "176",
            KEY = "C",
            TIME_SIG = "4/4"
        }
    },
    The_Best = {
        TIME = {"1989"},
        GENRE = {"rock", "pop rock"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"classics"},
        VIBES = {"iconic", "love", "upbeat"},
        METRICS = {
            BPM = "104",
            KEY = "C",
            TIME_SIG = "4/4"
        }
    },
    Three_Little_Birds = {
        TIME = {"1977"},
        GENRE = {"reggae", "roots reggae"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"classics"},
        VIBES = {"stoner", "iconic", "upbeat", "happy"},
        METRICS = {
            BPM = "74",
            KEY = "A",
            TIME_SIG = "4/4"
        }
    },
    Wildflowers_Wine = {
        TIME = {"2019"},
        GENRE = {"country", "blues"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {},
        VIBES = {"love", "sway"},
        METRICS = {
            BPM = "157",
            KEY = "C",
            TIME_SIG = "3/4"
        }
    },
    You_Are_the_Best_Thing = {
        TIME = {"2008"},
        GENRE = {"alt country", "country", "folk"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {},
        VIBES = {"love", "happy", "upbeat"},
        METRICS = {
            BPM = "171",
            KEY = "Asharp/Bflat",
            TIME_SIG = "4/4"
        }
    },
    Your_Smile = {
        TIME = {"1974"},
        GENRE = {"RnB", "soul", "funk"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"oldies", "ballad"},
        VIBES = {"sway", "love"},
        METRICS = {
            BPM = "125",
            KEY = "E",
            TIME_SIG = "4/4"
        }
    },
    valentine = {
        TIME = {"2017"},
        GENRE = {"alt rap"},
        LOCALE = {},
        --GENREMOD = {},
        SPECIAL = {"deep cuts"},
        VIBES = {"love", "upbeat"},
        METRICS = {
            BPM = "78",
            KEY = "Fsharp/Gflat",
            TIME_SIG = "4/4"
        }
    },
}

return {
    tags = tags, 
    ext = ext, 
    path = path
}
