	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018E24
sub_08018E24: @ 0x08018E24
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r6, r4, #0
	ldr r0, _08018E70 @ =gUnknown_03002514
	ldrb r0, [r0]
	ldr r5, _08018E74 @ =gUnknown_0808E594
	cmp r0, #1
	beq _08018E50
	ldr r0, _08018E78 @ =gUnknown_0848A378
	bl sub_080193B0
	ldr r3, [r5]
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r3, #4
	adds r1, r1, r3
	ldr r1, [r1]
	str r1, [r0, #0x14]
_08018E50:
	ldr r2, [r5]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08018E70: .4byte gUnknown_03002514
_08018E74: .4byte gUnknown_0808E594
_08018E78: .4byte gUnknown_0848A378

