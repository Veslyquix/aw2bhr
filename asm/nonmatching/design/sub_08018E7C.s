	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018E7C
sub_08018E7C: @ 0x08018E7C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08018EA8 @ =gUnknown_0848A378
	bl sub_0801930C
	ldr r0, _08018EAC @ =gUnknown_0200C528
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018EA8: .4byte gUnknown_0848A378
_08018EAC: .4byte gUnknown_0200C528

