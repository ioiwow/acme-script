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
���7bacme.sh �Z�WW�y�x��E�NB��]<���pzj9U������d�Lҙ	�zB+� *�(D@�JB��H��6o��俰�͛�L� ڵ[�,�f޻����Ͻo���${|���(�����M--_5m��/�C�0�l�3�9�x�Boq"b�	XL	�a��$e�1AE�:�����b(�C�R�~�W��:��O���?J���E�:B��O^��E�f ��+�:q��8�d5����6�芙�|nM�D4���l��|�xg�x馾��%��IC^F
 ���G����8E��*ˣH�e��`�DY��,#�`��kt���1"0cq_#��$��E���l5��t��x�|1Y���8K�_��`=�!�n�*��ZT��~QQ���h�?��Vp6��#x���)}6�O�w���5<�*<�rK/�MB�����w�f�S�ޣ
�GYQZg@$�M}i&�}+�������5}�R~{�����ų��H*���`�	�.�m�z	��U}z�4zU����&��b�����w�
7��v>7�g����q�&�(	\J���Qq=(7Z�$�ZG���x���2T�T�)!c-ڇQ�������dV_��ǋwG������=���n�qQ�(��x�z�dU�C!��E���+p��ӝ��8~�̙/;Ϋ�G\�<C?�<B?
>H}�ߏ�@��/�{ȨO��"!�����!cB��B�z���ʌ\�n�С����FE,�;���F��>���qj�}r<��闦K��2])� Uin��4%�nk;�� 3�a��6�*3��X$��o�p!1�8�-܂z5-��{<R�T����tk���*�D���2����{N�ۅ�Lw��m�S9'Zl��Ĳ_V�Z!Q��)�aQH��o�>h��vosK��݋�Y��FB�n!"(�C�&�(O���3s,��Dȝ�$UY"�ǥ���
���q���>���'�����[�w	'`y\�İ����E�( )� X��&J��������^�?x�_f���r �ګ'c��U���ȸJ�V����gPgW׉�3'?���ώכ��왺�4��œCa^��I�v���r�Ӑx��n�f�ȐqCj$@ ����A
r����>�6�I4�>Zy�S� V���Ԧ>~�k��/�MT��f��@j�U$YCl����¾�jj�C\muS˚�hȽx6쌺?Y� ����p~�v��y<=a��w��� ���j�����1I�U��,�^�#k$��N��K�	H:�oӅ�/�%!�w֋[����� �~���K���7��K�0/�,�qH},�ɘF:��Ȋ>�E:�Uлo�o�B�a��*�eTS�˵�g�!���RD�����ܖϤ
�6As[�12��� ��Mg�~��"s#S�j{�hc�H���o<n����!������r\,Tx?��#�[�5F/޻�?C�-9
�%���E�l[�(iy��	M/㏀�rwO9�#)JԔE��W)��
�H������F�6r���e��rP�/8���{9��u������$���L�$7A_��V�G�K�����N�
Ώ\��! _�~>����
�k~��Sx
��*ʂ�j$�����o���!	�K���AY�Kb��%�v���o���C�6�����e}.iVo�*KkNg�zxf�y 
�ww�zr�p?U��c�89Z��D>�8�!MQ 2�n���/+�8�v?�
��뀐��is6���ψ�|v�ΓB�����|ZI�vn�m�i�.�L�mb﯉a�(,��v��<��t)�B���=1|$�)-�?u���ȓ|n�B��+���na'�g&3��}��>�s{-2����NdIX�����Y�iZ�Q������[T���c��3�������=��@F�I[���as�/]��?�5�J�j
'�TP������F�q ��:?f�ш�����`5��5�TX�᝹
f_Mp]�ķ���$�2���.s�}5���Z �N�4���l�G�͏�
�Ң�Ԣ���]i��	"xցA}b�H�9ЕPe�C�a�@U�$;I�@�p� 0B�(�i!�h�#�Z˷����L��s��,
5H���~UH��?4x8NP"���@;Q� MPM�`�t�	��w�?�3�߈��������n��7��"I4��ay ��%hG�SP�[�Bٍ�N���;4&3[� �CB�`��"}~,�{�W����J?��tX�2x���x:S���>�Fs�� �v/'v*�b�7���ʓB^i��>�[�>x���Ok��\�gp�t�(��:��� �x�v13�{�_i,���,�K�O-9���x�-��%�������I�+�|v�+;d@����V�2	����>!��\�F��I�2f�Y|��`en���0��+ߑm��UkҪ�+�ه��A���r�$i�1i�<�BF\s��HQ��׫
��0�R,ei��R�w�p6Pٲ��e�B��Ҭ�6������9c~���GSx�(���n�W�V���c��HYW\��6�4ａ\t���ȃ�PL%��os�۩�qcHOWͭTY��r���8���(&�EP�9�h�ٟ��Oh9Xs�6侎IB߇D���^�$E���b+d�=	{���1��G�u��S<�����T
�F��t��&'#� �II��W��yozd/8����Uo��w&�3����&�y�Yz!-�T9į�nX֯��f�gpr���j�*ؠBs�' �����nauۦ��H�(}���X튇�����?�W��2�5�H�e+�7(��P������p8 ���15�i#Z�<�/gq�{��2;��Req�*��}q���-�����@U��d1��z��}�~�ĵdg�0� ���f�����I�&���$©lqg�|-Fn��ੜ4+�!�1��\X�c�BH�+~�z~XT��_������}��/�W~�O�/L;?���q]4�!4TM�7��G�?�E0�PGvY��YW�=(�zV>Zb^���i�����^O�=��+&�%v�ӢI�V,r�t�����ر�x�A�J�74��[�i�}f�6X�x�r�RV��\Z7���'Z}%*=Qc�םS��i���#�!-�yZ��F�[߬�P�Jz_(�
N���BO�r2�F#YW���H�L�'�V������G�Gb��C	���_s_�^��)�׍J����;�]��p�C�C��3�8� ��h���N�7�P씽���H_Z+fV~MT� �.��CUe���<�/���F	�U�Q�g��4݉��6�A��6����e�����[�M�q��S��OT��hLc�-G��b�$���E�6=�4�GG�#-�Q��s+<� �����83ͪ����� Q�$E�U��o�挎w+  