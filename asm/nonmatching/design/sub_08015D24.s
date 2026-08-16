	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015D24
sub_08015D24: @ 0x08015D24
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r6, _08015D50 @ =gUnknown_0808E534
	ldr r5, [r6]
	lsls r2, r4, #1
	adds r0, r2, r4
	lsls r0, r0, #5
	adds r1, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [r0]
_08015D3E:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #5
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r1
	bne _08015D54
	movs r0, #0
	b _08015D70
	.align 2, 0
_08015D50: .4byte gUnknown_0808E534
_08015D54:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1d
	bls _08015D3E
	ldr r0, [r6]
	adds r1, r2, r4
	lsls r1, r1, #5
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
	movs r0, #1
_08015D70:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

