#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�0�bacme.sh �mWW��ί��M���� e�xp�A����r�v��ۣ��M��d&���Y�Z��DP�໭���D�ts'�'��>w��d���ni*�{�������F("���h�s:�v������/��m'vq����vXJ*���K�8�[N",�kH���7 ��������:�j����i�(�P����C������1���h���/HH">����oa��G�V ��8p�w?T���/�Do��\��ʓB���i�u�:y6]z>S�>U:�`->�) >!�(��1t�
aS
���ESб�Eɽ���*�,t�=X55����h24�0R#0c	_!� d�GqDU���~��3�HJ5Su4���ѐl��A9�3%�����5)4�uC��ߠ��dv���d^UG�.="�/�g��kj���L6/��l�q��_z�l
b�<:i������8{���.S�]F���*&svd�6�I��>�N%Z��L%Ĥٵ~#!�{K�]�F�c��@�X7G��ϒ�*ݵ ����q�d'�w�ca��-T��G�dT4�^�QVSTƠ���ҕ�<��o�i3�8�|L�u8������?|���]��L#!~�c_h�`_�d�.Er�+Ń!�1��H��1�u�7Ԕ�8��8ľU<n��EDi��`�(����2B��w��|iz�d/�X��&��uj�<����GG��K\\��+�����i�@���A���ԏ�S1�v�,G3bHº�t��y�I]p���D����]Q p���E(KKd&[Z+<�S�}L��̐3p���[/�e\/�M�Sd�t��mX�q�;O�_#�@L21�57Qȯ�[OyĹqK� 6���'+d���Ma�,�iz�x�'��mr+K2k�+t��|��-�b�5��,���S�l��jhr���O�}���\��>��ق��7�oac��?>Ż��t��^+�\�&�z�W�Ȗ�<�
[ �9��'�N�� N5=��̜�$��t�h�hLug����<N�`� l�z���ӵ��u)S��Ɣ_�޾��כ`�J�'��2����p�իTי�����mkz�|9��M3it�Bq��OE���ٚ��1I��&+�P3 ��g��{�L����Ň�mŻ@a�(��Vȍoi>��Rl��+���=83�����P�bJ��U).�L]� ��nHԓ�]JA��v��mma��+��_iv�Lx��5��ᤒ2hQ`���U������M�V?���i�b��g}�!����9��WX�ɺ�F��/�݌�a�d*�052.|����(s��K���
�M��`*@)�l��k�9�-\3[:�N*�
���5�
�ō�޾�:�'���a�$O�,GU��N���bX����{���;�V�3�����}nOjh� �P���ڄM���V.U�YI~Ԕ�+��c��jk�lԚݲ&G�����2}�t���י;&�x�u4H�!^jM^A�ʆQ�Np��՘�K�]��Lņ<R�{p�A���C}G��}G�6~�)��F[�=��@��ZJ�jd"߲�_��͘��X��K�&2�A�=��!"��+NrBI��K1�m`;��3�Z�A�����[�����8޻q�d��h�ϑ�I��'�T�m�lX@�NB�E�/��7�:�k��&筎F(��x��κD�|�Pa�Z��92}�iX���3���t��Ȇ�F-�no��Ԟ/K[��m��=rz
^^��W�&W�������ғǴPe�K?�3�h�̔���K�(+.8�h<��t�;Ѱg�Ɓ�2���T�Λƛ��p"��vq����B�q�au(�6���2�=�0�=�ݢ���9;z5�A�Y�����a�mh)z��i+�K�ݑ���E�$!���b�.PA��:���޴������YY��ɣt�'�he;�Nأ��0�@B���������I�CNv�bv��DZ�g�N���[?ո���֗�����j\X���-�c��*�E���̥R��v����!�'ӉX�0W����v{�%�����j��M���N�4����+����ŇE�N��`GE�Wp���O!��2t�΄�z�_i��
��C��'��'��k�9�.6����5�whm��Z�a۾-��-�@�^=��$��@���T��7�إ����_�E�Ǆ��sl�6Rv��,g����x�_����*���c��1��=޹&�������y�ϬY�c�������C�[hL~�J���Ц�r[����*Μ��ie|���!��3�3��*'�����i�P��=�7��W�l�d�$�������P�٭W�> )������K�l����P�"����z�G8)���8|"��N=���:X��rzq>O6/Uc�ȩD����(�9�*K�����g��,��絤P/	Џ#�������������&�fZt�?��ͩ�y	W�U	��ş�pZ��7�\���x�R��%ɻ��5�l��z����ճ�|g���	>�jK�[�j�����1j�c瞂gwv�t{;Q��7EwƬ�ʳ����,��oy��w��N��`�c����<i]�*���`��d���D�\�&@�	���xP����U/�Ih�u8�U���7 �]���޷����-82��e�i�CfUZv𓵼Nr��3���!J��:V�П:F�����ҟ>4��~/�����;�1�:y��c�����E�H������B�LR�8@$�^��t�h�g�zӹr��)�X�)jI�����_��*?ޝ8i��A�̝�e.��G;�	��_���B4'T���
���P䷗�)͆�5�@/ѳ���|=���7��z#Y��׬Wm�J�7��C�V!�dz�����ٱ�x�A�J��5d�U,��d���k�5�j"e�l~Ԇ���^#�+Q�:����7e�y>�_씯?��!�k�����E�ǱN�$w�³_t�Hj&ū��\KIEp�����E�A߼���	��K���e��[F^��)Q8��w�׻{>>����k���i��O��X���ۛ)��W��Z�f���uk:.6��'���&�G�hL����v7��=�X*���gsTtAeS�~O�y3��xi��P�R��*yx�C�D�j2er��>�[⑬��F-vqݻ�k���! VڜM�S��vx��4<���_8i�%�fw_E|L�`�����	�%  