	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018F34
sub_08018F34: @ 0x08018F34
	push {r4, r5, lr}
	ldr r1, _08018F60 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r1, #4
	adds r4, r0, r1
	ldr r0, [r4]
	movs r1, #8
	ldrsh r0, [r0, r1]
	bl sub_0803CBD8
	cmp r0, #0
	bne _08018F64
	ldr r0, [r4]
	adds r0, #0x10
	str r0, [r4]
	movs r0, #1
	b _08018F6E
	.align 2, 0
_08018F60: .4byte gUnknown_0200C528
_08018F64:
	adds r0, r5, #0
	bl sub_08018BAC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_08018F6E:
	pop {r4, r5}
	pop {r1}
	bx r1

