	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014004
sub_08014004: @ 0x08014004
	adds r1, r0, #0
	b _0801406A
_08014008:
	ldrb r0, [r1]
	cmp r0, #0x14
	beq _0801403E
	cmp r0, #0x14
	bgt _0801402A
	cmp r0, #0xa
	beq _08014046
	cmp r0, #0xa
	bgt _08014020
	cmp r0, #9
	beq _08014058
	b _08014068
_08014020:
	cmp r0, #0xf
	bgt _08014068
	cmp r0, #0xc
	blt _08014068
	b _08014054
_0801402A:
	cmp r0, #0x17
	bgt _08014034
	cmp r0, #0x16
	bge _08014042
	b _08014054
_08014034:
	cmp r0, #0x83
	bgt _08014068
	cmp r0, #0x80
	blt _08014068
	b _08014054
_0801403E:
	movs r0, #0
	b _08014072
_08014042:
	subs r0, #0x16
	b _0801404C
_08014046:
	adds r1, #1
	ldrb r0, [r1]
	adds r0, #0x80
_0801404C:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0801406A
_08014054:
	adds r1, #1
	b _0801406A
_08014058:
	adds r1, #1
	ldrb r0, [r1]
	adds r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bhi _0801406A
	b _08014054
_08014068:
	adds r1, #2
_0801406A:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08014008
	movs r0, #1
_08014072:
	bx lr

