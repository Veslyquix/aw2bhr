	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017F0C
sub_08017F0C: @ 0x08017F0C
	push {r4, r5, r6, lr}
	ldr r2, _08017F4C @ =gUnknown_03001FF0
	movs r1, #0
	str r1, [r2]
	movs r4, #0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r6, r0, #0
_08017F1C:
	cmp r4, r5
	beq _08017F26
	adds r0, r4, #0
	bl sub_080192EC
_08017F26:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _08017F1C
	ldr r2, _08017F50 @ =gUnknown_0200C528
	asrs r0, r6, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08017F4C: .4byte gUnknown_03001FF0
_08017F50: .4byte gUnknown_0200C528

