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
��T1bacme.sh �mWW��ί��M���� e�x�����Tm��ۣ��$�a2��L����HP"���XE]��j�H�K�;�|�/�s��L&/�vmwf�}���zß�E$%��~F��������U��pb��)���KI��w	�����SH�Uĉ��7�0'a�=0��5QT��4O���5�om?�/b�4�D>�$��qI��S��f�Xh���B���z{���}�5z�-��O��UMU���l��|�tc�t�����%��I�@aF�!���PH4�(��78M�E^�d�
�,t�ݢb�:ˈ2x��t=%�ajL"��D��ب�x����C�_G*�R�T�ct��p6�� 醩��ޢ%5U��.�� ��h^Z��Ѽ��`]"�-nd�ټ95V�Z�[��d�zT�
K/�M��G'�s�*n=�f�R�ޥ�KQQX�C�$����F:)"��S�&�9S	>it�߈K�C���� K�G��&�gЋ ����9�Y'���=��,�vqv�ڼC_�k6S���Q������,S��B?�A�1G�>?�s���/;O膑F\�CH��G!�9�D�H�u���`��F��0TP�n� �JJ���?D�*�5f�a"�0@X��b����u	!|��F�4���s����d�P0OO�gs���(�ؤIă�64��n�S"Q;�ڈb�7HF��;�����'ZQ�a$��PHJ�z3�V�n��vR�?Q`��������#ōMk3���y;�T��������.G������
�uQ��B-|s��-�~��"t�[Zca�uU
��r ADq�ܔ��c]!0[H�,��G��k�+���xe���Qsvۜ5'��y<}�t�4�,��n�	���n�I�4q�%ADxn>�V�w *�|D_�h�JL�R7j7S�!U힔4ȺN���p߱�����`�Ѫ�C�~�E�g=��>=v��!l ��j)�+q��;�|�~���f�+?yH�[1��0
dYWc$_v��<L3� b�z{ئ]<��f�F+�qv2!X�:�nNށ��n��剳Utw$6��}������@��_�w-#��!pj��HYG��܋gc~���N!~>^�=Vܾ^�yO�ub��]R�K$��ú
����no�^�ngJۗ�����.>3//�ZWO���Y�_<�@
+m�.=yTz>�T����޵f���Li�yn)��%��|��*��D�f���N�;r��Oj�	"
z�M���h8}O��(�
���=� ��T E$���.��s�g<���Y��3��� �c=����!�]�/�m���HT
��	���C���B.^�K%�[p�{��N�;7�f��ef@ ���w�(����C
Z��v	��f�*����Ur;��DLE4B���� ��hL�51v�$M� �sv����AJ\RN�BxoZ~�t��k
5`qs���t�F2� /ԗ6bGK�Ի��N;V.��҉X [*Q^V����S�Z�k'˴<ɢ������q�F�����x�aQ��r)�`��3���=�|���͹�Ӛ@�^Z�Km^�����}|f�\�i�ș�y�n�Z���8s�|q�<o�����L�O�%ߝW�

��@���Sk�7\O$ƨ�i��fѝ-l���q�����,�zZϲ^6K���]q�I���ÿ���FAa��׻�(����������Xg��c������L��#M��\,�W��u���P�m[[9<3e͜��i�t��v:d3OMI����o2Ը�X�iZ�	T9��k�5����X��m:��~-`�� �*�Y���4��֗'�,�<���HV#����z��b��G]3�ɤ����qX�,kl]��
xk�
-N�X\��Ga�!Z	*H��8;�%8O?�%�yف�.���B̗*������z��NR��7��Mw�UZ�9A��쀘�b���$���Рa6c�2�&)~�!(,0�
��/
���X�>���rT}��-���d.(��t{��5<�H�J'� ��]��ֿ��K�8|q
�!o�²�
�y��^�@�@��D���z�"�l� N�@Yz��ۧ�8���ֵ���4��LY-k%�Q^(6`㕰�ا44���.�g������Ӫ��������&ʮ ]Q�='4�~����5�_y"���c��M� >��G�N��
�ZA�� 6��w+�\qc�[�>T��5Ǔn�;��⧏I�>��fs�/�� ��PX���������l#��Cz<s��}�/���3�˹J�-����C�@v@r����Iou�ڌؗ$t\��h��\$v�q�#�Q�P\�U�|�{��������0 DN�K!C���r�!^K�#H��������5ym�i|�������pRN�$���v���k��u�5Tp�ڕ|��Y����
�؄����?���V��d(�}����	7;Є I6"���*=Kͱ���x�c��g#6�g����_�;����v�n�3RL�q��7��k�N�c�z$�j>�.Lp>!n�#'�Xz�'�Q�Ha�o��o�gG!�qf��p˛�<N��'P����u"ܼ�m���`!�9��r�͍��0��z���i�:P5ːj�י�:Xw�-l���~���ڷ��|2'�!4�[��H]w��8��{`'sy�~���l\���~���8���2Va�\\���Ъ���&�����̚R|���Yw�����e����b���u?+�M9� ��Fik˹�'C����M�q}�	�xBTRD��,��߾�/U�����)�3�����_�3���g�2;�S���#�;#�zu~N��Fj0���#Ά�� ������e�B=��wW�{#^wدY�ڨ�دN�%�Zu�����rW��*��;�+�ޖ�BV��Q%��쬰�\c�������#�׈��BT[�N��;�����1�#{n)�xj]�!���2l5|DV�qQ�٫8�B���F���j�s5'�TSGS��r�<v�� cEZM�Hg�,nO��n�y}�;�D� *ߞ7������J��O)g�����ō������� 2�VK��_Gk�V:rBcN)��&>��c����nbv�j"Z�`L/�����K�V|s����{B�ρ*��ͭ����N%"�֫$S#�?�a�%I
M�a�d���x�M���l�����W���mx����I�:/0$���(bc��A�����"�%  