	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070EF4
sub_08070EF4: @ 0x08070EF4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #2
	beq _08070F1C
	cmp r0, #2
	bgt _08070F08
	cmp r0, #1
	beq _08070F0E
	b _08070F30
_08070F08:
	cmp r1, #3
	beq _08070F24
	b _08070F30
_08070F0E:
	ldr r1, _08070F18 @ =0x04000063
	movs r0, #8
	strb r0, [r1]
	adds r1, #2
	b _08070F38
	.align 2, 0
_08070F18: .4byte 0x04000063
_08070F1C:
	ldr r1, _08070F20 @ =0x04000069
	b _08070F32
	.align 2, 0
_08070F20: .4byte 0x04000069
_08070F24:
	ldr r1, _08070F2C @ =0x04000070
	movs r0, #0
	b _08070F3A
	.align 2, 0
_08070F2C: .4byte 0x04000070
_08070F30:
	ldr r1, _08070F40 @ =0x04000079
_08070F32:
	movs r0, #8
	strb r0, [r1]
	adds r1, #4
_08070F38:
	movs r0, #0x80
_08070F3A:
	strb r0, [r1]
	bx lr
	.align 2, 0
_08070F40: .4byte 0x04000079

