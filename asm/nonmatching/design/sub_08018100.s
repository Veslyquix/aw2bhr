	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018100
sub_08018100: @ 0x08018100
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08018150 @ =gUnknown_03002514
	ldrb r0, [r0]
	ldr r4, _08018154 @ =gUnknown_0808E568
	cmp r0, #1
	beq _08018130
	ldr r3, _08018158 @ =gUnknown_03002F08
	ldr r2, [r4]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	strh r0, [r3, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0801815C
_08018130:
	ldr r2, [r4]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08018150: .4byte gUnknown_03002514
_08018154: .4byte gUnknown_0808E568
_08018158: .4byte gUnknown_03002F08

