	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017C70
sub_08017C70: @ 0x08017C70
	push {r4, r5, r6, lr}
	ldr r6, _08017CA8 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r5, r6, #4
	adds r5, r4, r5
	ldr r1, [r5]
	movs r2, #8
	ldrsh r0, [r1, r2]
	movs r2, #0xa
	ldrsh r1, [r1, r2]
	bl sub_08029088
	adds r6, #8
	adds r4, r4, r6
	ldr r0, _08017CAC @ =sub_08017C4C
	str r0, [r4]
	ldr r0, [r5]
	adds r0, #0x10
	str r0, [r5]
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08017CA8: .4byte gUnknown_0200C528
_08017CAC: .4byte sub_08017C4C

