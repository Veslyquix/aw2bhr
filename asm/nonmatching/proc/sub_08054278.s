	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054278
sub_08054278: @ 0x08054278
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r3, _080542D8 @ =gUnknown_020296B0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r0, r1, r3
	ldrh r0, [r0, #0x18]
	lsls r0, r0, #1
	adds r2, r0, r1
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r2, r0
	ldrh r5, [r0]
	cmp r5, #0xff
	beq _080542D0
	ldr r0, _080542DC @ =gUnknown_03004508
	adds r1, r3, #0
	adds r1, #0x1e
	adds r1, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bne _080542D0
	ldr r3, _080542E0 @ =gUnknown_08553744
	ldr r2, _080542E4 @ =gUnknown_085D6A48
	ldr r0, _080542E8 @ =gUnknown_03004580
	lsls r1, r4, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
_080542D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080542D8: .4byte gUnknown_020296B0
_080542DC: .4byte gUnknown_03004508
_080542E0: .4byte gUnknown_08553744
_080542E4: .4byte gUnknown_085D6A48
_080542E8: .4byte gUnknown_03004580

