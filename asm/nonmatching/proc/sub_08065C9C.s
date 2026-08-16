	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065C9C
sub_08065C9C: @ 0x08065C9C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _08065CD0 @ =gUnknown_0816E114
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, #0x32
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r1, _08065CD4 @ =gUnknown_0816E118
	ldr r0, [r1]
	ldr r5, [r0]
	ldrh r3, [r5, #2]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08065CDA
	cmp r4, #0
	bne _08065CD8
	cmp r3, #0
	beq _08065CDA
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _08065CDA
	subs r4, r6, #1
	b _08065CDA
	.align 2, 0
_08065CD0: .4byte gUnknown_0816E114
_08065CD4: .4byte gUnknown_0816E118
_08065CD8:
	subs r4, #1
_08065CDA:
	ldr r0, [r1]
	ldr r1, [r0]
	ldrh r3, [r1, #2]
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _08065CFE
	subs r0, r6, #1
	cmp r4, r0
	bne _08065CFC
	cmp r3, #0
	beq _08065CFE
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _08065CFE
	movs r4, #0
	b _08065CFE
_08065CFC:
	adds r4, #1
_08065CFE:
	ldr r5, [r2]
	ldr r0, [r5]
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _08065D14
	movs r0, #0x64
	bl sub_0803B4DC
_08065D14:
	ldr r0, [r5]
	adds r0, #0x32
	strb r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

