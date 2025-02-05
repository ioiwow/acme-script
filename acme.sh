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
��>bacme.sh �kS�V��ŭ�Эll(�%C��t�NS�M��i;�,ˠ��]I�xC:�0Iȃ��G��I�I��<�_Z_�������J����6۲�ֽ�{���s�7��D���.כ��T.{;���ɤvgY������돵�������[�
���`��f
���,^���ڒ69U���oⵛ?� ��mm�n� y6�5��&���8}f�$0�.Y��}����e��F_����Bq�	�baN��!x�5G�/ ��"V@�1�)�/�����ы�NY�*����	!��V�o���%�B�?W�.#��bc�q�[�'S� �����O�m?�XI@����o#.���m-�Ѩ��.��������x��-m�C ��|.1� B^A� �.Nee!,p� (�"�K�\�@+�&HjTa\B�J���P1��-bO"VDLP��Ĕ�8A�_G<��x��t��p��}���(������(��dE�J����h^���h�#h��b��Mg���h�s����[���,�P�D�gn�>�JIz�2�.EEa�]�0���>p&�]��������G�-��G���Z��C}}��"C�K��6���ڽ~�_c8�Nf��8=��7H8N����1��fH�M�x,ȩ�Q�Q�����{*Q0k�rxc�U>V�! �����>BP"Vi�4�.U�)-^��t*���w�4!��B�A����T
���Yn3�g3��7�O�p�(oc��%��	�ΌAkF~����z����->c��Ň�Y�H��{<|T
�^GQ�8=�e�1.%,�+���]t6��ӳ$��n�n>���B�v�6����k�#������	'g����
^���
���zz��D^@ǼA��+�A��co���L ,��A�PT�I)���zmT�sbL%�
1���gϠ�mm';ΔL����/�z���'g�T]��i�ϝ*�pR'���B�a'��,�p
o<��-Z�i�xu����GCib:�O0�5��SG�qjB"hP�X�F�Cn�&��jax�d�=7��z�Q݅�,J*b�E/��]��b]��U!u�ˊ��'��8���H���n�%�{.ءq�\a�p�O���/�������J~�i��0xD~�]է� e~�66��İ>�0�@�=�>#K�\\��~C�.��[�[�Q_$��q��.��|l�7.���M�?0v�!"��H��r�f<���涌�/0C|�� "�ҥO?%�䞯�E���V��T�	��/VA&Y&��%{I�絀��"01�~�dgQ䤅RA)�W�pvD�G!�C�1j�}������˴`���6���y����i���ิTS�d���d��9�^���X��!�D%�#���4��}|r���QI8q��j֞�O�;E69����M��Z6�P��;1
��>W0
 �w�6c�b$A��U��2|8�,x|�7AR��F2v[���R��� ��^q�5�Q�V/��P�Ly$ׁ[(���X�Kx�e!`��g��}!�EM@	/��^3�UGXPA��DL%~]�������ar���4&HQ���c��9�Y �� ��}��!�RZ!'�@���0L� ��]���`��+���n5�F����"�x)����l*���� F�;��GB�H���%��EA�m���( �1�Bj��޹V���B3ή�;�ʶS4Wў4r�6g��-f؞�������m��5t�1^-b���hq`��_���vc���' �jג��"獹�\v�t �Z��Emힾ�֒��Ք�6���qr�pe�|�tF4<��G�ʶ��V���g!� k�x�ǥr�x�re�o�L��VtSz�SJt��ۜ��'at���^Lk�l>��+`c$dٴ�~� �B:��N1������ez��G�i�Gr[���)H2��`�嶮���sY8�O��;i<5�O���}���ZdO����q�m�Q�P���?����ɶS�'BU�fV{z���<�f59V�N5\�.mQ���6I_t5s�l��s]���t�t~�dD�x�#yo/.�O.ʳ�!s+):2P�<}���Ag�-��PVY��Z�@heET�eY^�J�`mŒ�T�����4���M0��J$��e�t�X�^vSo`_�%ʠ���?�F������������|eg ?.ð�c2��B;�̒R���ù�gx�9�M�G��� ��F�^��8����&�iԱ�J�܋��B��� �^��DX���V���8v7�]n�T�l�Z�}�)����p��w�k���WN�W@t6a�]�5�Ĝ	:�1>!�ʝj{<�P:�Z<�6� 1��C��ܹ�r�ꦍC��ϟ��ߵd3�q'3fܙ}��dЭ��}"� �V�R:����.�ӏ��e��7�� M-�p&eB��2������+���DE.�\��|���ٖBoo��q�%����w�^U�x�saֈ������V�{=E]r���P���r�=P�w(*���q��>k��9n�>.���<�ʳ؅����ha�,U�?��S���J�K�¤�
���N9+	c���W�'�b߾��oŏ��JB�u�Q�����0��xr_ϸ� �D	�|�7��k����H>T�*�u�˗ؐt��a����R��i��(�"\��_��"��^�ZL�Z�In�G��3ZMW�z�v���E������C�$�� �b���/Х@7�$M���d�S�S�����T�T��ǁ�hnlb:|Q�2�y�x��e^���v�=�*7+����S3U9�+R�V�9W�+K��~H�89_�Y�ۙ�9Ӓ�c(�ϝ0*sȦ��]})kÂ9�樣y�?5V�v'"�nA�u���.i��~�~k"ў�5VYʾ��y��(�@;��.3�/�\��vl��@I��&N�5�ag��I���2[}kM��;��
ru}�����?kZq���^�U��|��e�x�A�r��������_$3P�@8����1_q�/�K'���!��b]Á�l��^���_�+e����V�E����?]O�L;?�W�q_0^$�X�7��G����bF�6�{�J�h>K-2/W���qm!;�W�u����r����_Q�%�4�C}9ur,^��H���d�=ERcfo�U��2U�Ae9mΥU��\5Ҫ3Q��
���B�҇ӏ���������A�,o�0���p��S�q�N/x��"�J,��ue+����������U��t>Ѹ
���᥀��菹��,_�(�σ
+׵G�Xvڥ70Ń&=�6'J�Ȥf1^��g�p�!N]���wP�Շ���-�3�ph.+�����'��f�E�G#�#���PMD'���i£����@|H���"�'t�b_[����n@�y:	r������1d�j���� 	#��QI�s<ە	<��F�c�cr\'i��me6<\���v�1�T4  