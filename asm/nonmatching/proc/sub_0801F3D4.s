	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F3D4
sub_0801F3D4: @ 0x0801F3D4
	cmp r0, #0xbb
	ble _0801F3DC
	movs r0, #5
	b _0801F3FE
_0801F3DC:
	cmp r0, #0xb7
	ble _0801F3E4
	movs r0, #4
	b _0801F3FE
_0801F3E4:
	cmp r0, #0xab
	ble _0801F3EC
	movs r0, #3
	b _0801F3FE
_0801F3EC:
	cmp r0, #0x42
	ble _0801F3F4
	movs r0, #2
	b _0801F3FE
_0801F3F4:
	cmp r0, #0x3d
	bgt _0801F3FC
	movs r0, #0
	b _0801F3FE
_0801F3FC:
	movs r0, #1
_0801F3FE:
	bx lr

