var dayGraph = [
  ["ak", "ck", "ek", "gk", "ik"],
  ["bl", "dl", "fl", "hl", "jl"],
  ["cm", "em", "gm", "im", "am"],
  ["dn", "fn", "hn", "jn", "dn"],
  ["eo", "go", "io", "ao", "co"],
  ["gq", "iq", "aq", "cq", "eq"],
  ["hr", "jr", "br", "dr", "fr"],
  ["is", "as", "cs", "es", "gs"],
  ["au", "cu", "eu", "gu", "lu"],
  ["bv", "dv", "fv", "hv", "jv"],
  ["ck", "ek", "gk", "ik", "ak"],
];

var table1List = ["비견", "겁재", "식신", '상관', '편재', '정재', '편관', '정관', '편인', '정인'];
var table1 = {
  'a': "abcdefghij",
  'b': "badcfehgji",
  'c': "cdefghijab",
  'd': "dcfehgjiba",
  'e': "efghijabcd",
  'f': "fehgjibadc",
  'g': "ghijabcdef",
  'h': "hgjibadcfe",
  'i': "ijabcdefgh",
  'j': "jibadcfehg",
};
Map<String, Map> table3 = {
  'k': {
    241: 'i',
    null: null,
    482: 'j',
  },
  'l': {
    219: 'j',
    73: 'h',
    438: 'f',
  },
  'm': {
    170: 'e',
    171: 'c',
    389: 'a',
  },
  'n': {
    243: 'a',
    null: null,
    486: 'b',
  },
  'o': {
    219: 'b',
    73: 'j',
    438: 'e',
  },
  'p': {
    170: 'e',
    171: 'g',
    389: 'c',
  },
  'q': {
    240: 'c',
    241: 'f',
    266: 'd',
  },
  'r': {
    219: 'd',
    73: 'b',
    438: 'f',
  },
  's': {
    170: 'e',
    171: 'i',
    389: 'g',
  },
  't': {
    243: 'g',
    null: null,
    486: 'h',
  },
  'u': {
    219: 'h',
    73: 'd',
    438: 'e',
  },
  'v': {
    170: 'e',
    169: 'a',
    389: 'l',
  },
};

var table5List = ['장생', '목욕', '관대', '건록', '제왕', '쇠', '병', '사', '묘', '절', '태', '양'];
var table5 = {
  'a': 'vklmnopqrstu',
  'b': 'qponmlkvutsr',
  'c': 'mnopqrstuvkl',
  'd': 'tsrqponmlkvu',
  'e': 'mnopqrstuvkl',
  'f': 'tsrqponmlvku',
  'g': 'pqrstuvklmno',
  'h': 'kvutsrqponml',
  'i': 'stuvklmnopqr',
  'j': 'nmlkvutsrqpo',
};
var table6_1List = ['양인', '비인', '암록', '금여록', '관록', '명위록', '시록', '홍염', '내록', '삼귀기인'];
var table6_1 = {
  'a': ['n', 't', 'v', 'o', 'm', 'cm', 'v', 'q', 'ln'],
  'b': ['o', 'u', 'u', 'p', 'n', 'dn', 'u' 's', 'mo', 'gea'],
  'c': ['q', 'k', 's', 'r', 'p', 's', 'm', 'oq'],
  'd': ['r', 'l', 'r', 's', 'q', 'r', 'r', 'pr'],
  'e': ['q', 'k', 's', 'r', 'p', 's', 'o', 'oq', 'dcb'],
  'f': ['r', 'l', 'r', 's', 'q', 'r', 'o', 'pr', 'dcb'],
  'g': ['t', 'n', 'p', 'u', 's', 'iq', 'p', 'u', 'rt', 'dcb'],
  'h': ['u', 'o', 'o', 'v', 't', 'jt', 'o', 't', 'su'],
  'i': ['k', 'q', 'm', 'l', 'v', '', 'm', 'k', 'uk', 'hji'],
  'j': ['l', 'r', 'l', 'm', 'k', '', 'l', 's', 'vl', 'hji'],
};
var table6_2List = ['대극귀신', '천을귀신', '복성귀신', '천주귀신', '천복귀신', '천관귀신', '문창귀신', '절도귀신'];
var table6_2 = {
  'a': ['kq', 'rl', 'm', 'p', 't', 'r', 'p', 'p'],
  'b': ['kq', 'sk', 'lv', 'q', 's', 'o', 'q', 'r'],
  'c': ['nt', 'tv', 'ku', 'k', 'k', 'p', 's', 'p'],
  'd': ['nt', 'vt', 't', 'p', 'v', 'm', 't', 'r'],
  'e': ['oulr', 'lr', 's', 'q', 'n', 'n', 's', 'p'],
  'f': ['oulr', 'ks', 'r', 's', 'm', 'u', 't', 'r'],
  'g': ['mv', 'lr', 'q', 'm', 'q', 'v', 'v', 'v'],
  'h': ['mv', 'mq', 'p', 'q', 'p', 's', 'k', 'l'],
  'i': ['ps', 'np', 'o', 't', 'lr', 't', 'm', 'v'],
  'j': ['ps', 'pn', 'n', 'v', 'ou', 'q', 'n', 'l'],
};

var table6_3List = ['천덕귀인', '월덕귀인', '천덕합', '월덕합'];
var table6_3 = {
  'm': 'dcih',
  'n': 'sapf',
  'o': 'iidd',
  'p': 'hgcb',
  'q': 'vcmh',
  'r': 'aaff',
  's': 'jied',
  't': 'mgvb',
  'u': 'cchh',
  'v': 'bagf',
  'k': 'pisd',
  'l': 'ggbc',
};

var table6_4 = {
  'm': 'u',
  'n': 'r',
  'o': 'o',
  'p': 'l',
  'q': 'u',
  'r': 'r',
  's': 'o',
  't': 'l',
  'u': 'u',
  'v': 'r',
  'k': 'o',
  'l': 'l',
};

var table6_5List = ['역마', '함지', '월살', '망신', '장성', '반안', '천살', '지살', '재살', '겁살', '조문', '조객', '혈도'];

var table6_5 = {
  'k': 'mtuvklrsqpmuu',
  'l': 'mqrstuopnmnvt',
  'm': 'snopqrlmkvoks',
  'n': 'pklmnouvtsplr',
  'o': 'mtuvklrsqpqmq',
  'p': 'vqrstuopnmrnp',
  'q': 'snopqrlmkvsoo',
  'r': 'pklmnouvtstpn',
  's': 'mtuvklrsqpuqm',
  't': 'vqrstuopnmvrl',
  'u': 'snopqrlmkvksk',
  'v': 'pklmnouvtsltv',
};
Map<List, List<String>> table7 = {
  ['ak', 'bl', 'cm', 'd', 'neo', 'fp', 'gq', 'is', 'jt']: ['u', 'v'],
  ['au', 'bv', 'ck', 'dl', 'emf', 'n', 'go', 'hp', 'iq', 'jr']: ['s', 't'],
  ['as', 'bt', 'cu', 'dv', 'ek', 'fl', 'gm', 'hn', 'io', 'jp']: ['q', 'r'],
  ['aq', 'br', 'cs', 'dt', 'eu', 'fv', 'gk', 'hl', 'im', 'jn']: ['o', 'p'],
  ['ao', 'bp', 'cq', 'dr', 'es', 'ft', 'gu', 'hv', 'il']: ['m', 'n'],
  ['am', 'bn', 'co', 'dp', 'eq', 'fr', 'gs', 'ht', 'iu', 'jv']: ['k', 'l'],
};
Map<String, String> table8 = {
  'a': 'n',
  'b': 'o',
  'c': 'q',
  'd': 'r',
  'e': 'q',
  'f': 'r',
  'g': 't',
  'h': 'u',
  'i': 'k',
  'j': 'l',
};
Map<String, String> table9 = {
  'k': 'rp',
  'l': 'qs',
  'm': 'tr',
  'n': 'su',
  'o': 'vt',
  'p': 'uk',
  'q': 'lv',
  'r': 'km',
  's': 'nl',
  't': 'mo',
  'u': 'pn',
  'v': 'oq',
};

var table10 = [
  'nmlkvutsrqpo',
  'mlkvutsrqpon',
  'lkvutsrqponm',
  'kvutsrqponml',
  'vutsrqponmlk',
  'utsrqponmlkv',
  'tsrqponmlkvu',
  'srqponmlkvut',
  'rqponmlkvuts',
  'qponmlkvutsr',
  'ponmlkvutsrq',
  'onmlkvutsrqp'
];

var table11A = {
  'a': [0, 1],
  'b': [2, 3],
  'c': [4, 5],
  'd': [6, 7],
  'e': [8, 9],
  'f': [10, 11],
  'g': [12, 13],
  'h': [14, 15],
  'i': [16, 17],
  'j': [18, 19],
};
var table11B = ['m', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'k', 'l'];

var table11 = [
  ['b', 'g', 'g', 'j', 'j', 'j', 'g', 'g', 'g', 'g', 'c', 'c'],
  ['j', 'ecfd', 'id', 'gd', 'gd', 'gd', 'id', 'cd', 'iajd', 'edc', 'cg', 'cg'],
  ['c', 'c', 'j', 'j', 'j', 'j', 'c', 'j', 'j', 'c', 'c', 'c'],
  ['j', 'j', 'ec', '', 'c', 'c', 'fj', 'dc', 'h', 'e', '', ''],
  ['i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'a', 'a', 'i', 'i'],
  ['g', 'f', 'a', 'jg', 'g', 'g', 'e', 'j', 'i', 'gei', 'fe', 'a'],
  ['a', 'g', 'a', 'a', 'i', 'a', 'a', 'a', 'a', 'a', 'a', 'a'],
  ['g', 'a', 'g', 'g', 'jg', 'ig', 'ceg', 'ceg', 'eg', 'g', 'g', 'g'],
  ['c', 'c', 'a', 'a', 'i', 'j', 'c', 'c', 'a', 'a', 'c', 'c'],
  ['ja', 'ja', 'jc', 'jc', 'ca', 'ca', 'ja', 'j', 'jc', 'c', 'a', 'a'],
  ['c', 'a', 'c', 'j', 'j', 'j', 'c', 'c', 'a', 'c', 'c', 'c'],
  ['ag', 'jc', 'ja', 'c', 'c', 'c', 'j', 'j', 'jc', 'ea', 'ea', 'ea'],
  ['e', 'd', 'a', 'i', 'i', 'd', 'd', 'd', 'a', 'd', 'd', 'c'],
  ['adci', 'acg', 'dij', 'ecd', 'j', 'a', 'a', 'ca', 'i', 'c', 'ca', 'da'],
  ['f', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'c', 'c'],
  ['ig', 'a', 'a', 'ja', 'jf', 'ga', 'ea', 'a', 'a', 'c', 'eai', 'ief'],
  ['g', 'e', 'g', 'i', 'j', 'h', 'e', 'a', 'a', 'e', 'e', 'c'],
  ['ec', 'hg', 'g', 'ghj', 'hg', 'a', 'd', 'g', 'c', 'gc', 'c', 'da'],
  ['h', 'g', 'c', 'h', 'g', 'g', 'd', 'h', 'h', 'g', 'c', 'c'],
  ['c', 'h', 'ha', '', 'ihj', 'ijh', '', 'c', 'ija', 'hed', 'h', 'j']
];
