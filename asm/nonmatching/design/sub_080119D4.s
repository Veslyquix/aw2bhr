	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080119D4
sub_080119D4: @ 0x080119D4
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
_080119E0:
	movs r2, #0xf
	ands r2, r5
	cmp r2, #9
	bhi _080119FA
	movs r1, #0xf4
	lsls r1, r1, #2
	adds r0, r1, #0
	orrs r2, r0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08011704
	b _08011A06
_080119FA:
	ldr r0, _08011A1C @ =0x000003D6
	adds r2, r2, r0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08011704
_08011A06:
	adds r0, r4, #0
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsrs r0, r5, #4
	adds r5, r0, #0
	cmp r5, #0
	bne _080119E0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011A1C: .4byte 0x000003D6

