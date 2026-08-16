	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011B5C
sub_08011B5C: @ 0x08011B5C
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r0, _08011B74 @ =gUnknown_0808E518
	ldr r4, [r0]
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, r3
	bne _08011B78
	str r2, [r4]
	b _08011B92
	.align 2, 0
_08011B74: .4byte gUnknown_0808E518
_08011B78:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _08011B92
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, r3
	bne _08011B78
	movs r0, #0
	str r0, [r1]
_08011B92:
	pop {r4, r5}
	pop {r0}
	bx r0

