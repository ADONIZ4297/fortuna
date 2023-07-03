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
  'c': 'mnopqrstukkl',
  'd': 'tsrqponmlvvu',
  'e': 'mnopqrstukkl',
  'f': 'tsrqponmlvvu',
  'g': 'pqrstuvklnno',
  'h': 'kvutsrqpomml',
  'i': 'stuvklmnoqqr',
  'j': 'nmlkvutsrppo',
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
