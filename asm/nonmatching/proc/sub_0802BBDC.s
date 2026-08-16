	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BBDC
sub_0802BBDC: @ 0x0802BBDC
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r1, #0x8c
	lsls r1, r1, #0xf
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	ldr r1, _0802BC40 @ =gUnknown_030033EC
	ldrh r2, [r1]
	ldr r1, _0802BC44 @ =gUnknown_08499598
	ldr r3, [r1]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	movs r1, #5
	bl sub_0802BD54
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0802BC48 @ =gUnknown_03004080
	ldrh r2, [r1]
	movs r1, #5
	bl sub_0802BD54
	adds r0, r4, #0
	adds r0, #0x16
	ldr r5, _0802BC4C @ =gUnknown_0849A3B8
	ldr r3, _0802BC50 @ =0x0000700A
	movs r1, #5
	adds r2, r5, #0
	bl sub_0801BD00
	adds r4, #0x4e
	ldr r3, _0802BC54 @ =0x0000700B
	adds r0, r4, #0
	movs r1, #6
	adds r2, r5, #0
	bl sub_0801BD00
	ldr r1, _0802BC58 @ =gUnknown_030033F0
	movs r0, #1
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BC40: .4byte gUnknown_030033EC
_0802BC44: .4byte gUnknown_08499598
_0802BC48: .4byte gUnknown_03004080
_0802BC4C: .4byte gUnknown_0849A3B8
_0802BC50: .4byte 0x0000700A
_0802BC54: .4byte 0x0000700B
_0802BC58: .4byte gUnknown_030033F0

