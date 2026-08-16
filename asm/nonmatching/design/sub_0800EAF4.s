	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800EAF4
sub_0800EAF4: @ 0x0800EAF4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _0800EB50 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _0800EB54 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _0800EB58 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800EB4A
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x25
	bl sub_0800EBFC
	adds r5, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x65
	bl sub_0800EBFC
	adds r4, #1
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x27
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x67
	bl MakeTileSimple
_0800EB4A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800EB50: .4byte gUnknown_08499590
_0800EB54: .4byte 0x0000417A
_0800EB58: .4byte 0x00000A22

