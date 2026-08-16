	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E3B4
sub_0801E3B4: @ 0x0801E3B4
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	beq _0801E3DC
	cmp r1, r0
	bgt _0801E3D2
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	beq _0801E3D8
	b _0801E3E4
_0801E3D2:
	cmp r1, r2
	beq _0801E3E0
	b _0801E3E4
_0801E3D8:
	movs r0, #0x10
	b _0801E3E6
_0801E3DC:
	movs r0, #0x20
	b _0801E3E6
_0801E3E0:
	movs r0, #0x40
	b _0801E3E6
_0801E3E4:
	movs r0, #8
_0801E3E6:
	bx lr

