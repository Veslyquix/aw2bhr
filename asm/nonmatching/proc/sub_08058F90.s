	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058F90
sub_08058F90: @ 0x08058F90
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r7, _08059038 @ =0x00007FFF
	mov r0, sp
	strh r7, [r0]
	ldr r6, _0805903C @ =gUnknown_030033EC
	ldrh r1, [r6]
	ldr r5, _08059040 @ =gUnknown_08499598
	ldr r2, [r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08058FC2
	movs r0, #1
	mov r1, sp
	adds r2, r4, #0
	bl sub_08059050
_08058FC2:
	ldrh r1, [r6]
	ldr r2, [r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08058FE4
	movs r0, #2
	mov r1, sp
	adds r2, r4, #0
	bl sub_08059050
_08058FE4:
	ldrh r1, [r6]
	ldr r2, [r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08059006
	movs r0, #3
	mov r1, sp
	adds r2, r4, #0
	bl sub_08059050
_08059006:
	ldrh r1, [r6]
	ldr r2, [r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08059028
	movs r0, #4
	mov r1, sp
	adds r2, r4, #0
	bl sub_08059050
_08059028:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _08059044
	movs r0, #1
	rsbs r0, r0, #0
	b _08059046
	.align 2, 0
_08059038: .4byte 0x00007FFF
_0805903C: .4byte gUnknown_030033EC
_08059040: .4byte gUnknown_08499598
_08059044:
	movs r0, #0
_08059046:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

