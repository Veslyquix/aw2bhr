	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019940
sub_08019940: @ 0x08019940
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r4, #1
	ldr r7, _0801999C @ =gUnknown_0808E5B4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r5, r1, #2
_08019954:
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x2a
	adds r1, r5, r1
	adds r1, #0x2a
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08019982
	adds r0, r4, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08019982
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08028874
_08019982:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _08019954
	bl sub_08028568
	ldr r1, _080199A0 @ =gUnknown_030032D8
	movs r0, #0x12
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801999C: .4byte gUnknown_0808E5B4
_080199A0: .4byte gUnknown_030032D8

