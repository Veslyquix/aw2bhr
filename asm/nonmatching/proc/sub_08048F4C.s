	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08048F4C
sub_08048F4C: @ 0x08048F4C
	push {r4, lr}
	ldr r0, _08048F90 @ =gUnknown_084C30F8
	ldr r2, [r0]
	adds r3, r2, #0
	adds r3, #0x30
	ldrb r0, [r3]
	cmp r0, #0
	bne _08048FCA
	ldr r0, _08048F94 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08048FCA
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08048F98
	ldrh r0, [r2, #0x1e]
	cmp r0, #0
	beq _08048FCE
	subs r0, #1
	strh r0, [r2, #0x1e]
	ldrh r0, [r2, #0x1e]
	ldrh r1, [r2, #0x20]
	cmp r0, r1
	bne _08048FC4
	cmp r0, #0
	beq _08048FC4
	subs r0, #1
	strh r0, [r2, #0x20]
	movs r0, #2
	b _08048FC2
	.align 2, 0
_08048F90: .4byte gUnknown_084C30F8
_08048F94: .4byte gUnknown_03002EE0
_08048F98:
	ldr r4, _08048FD4 @ =gUnknown_02028E1C
	ldrh r0, [r2, #0x1e]
	adds r1, r0, #1
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08048FCE
	strh r1, [r2, #0x1e]
	ldrh r0, [r2, #0x1e]
	ldrh r1, [r2, #0x20]
	subs r0, r0, r1
	cmp r0, #2
	bne _08048FC4
	adds r0, r1, #3
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08048FC4
	adds r0, r1, #1
	strh r0, [r2, #0x20]
	movs r0, #3
_08048FC2:
	strb r0, [r3]
_08048FC4:
	movs r0, #0x67
	bl sub_0803B4DC
_08048FCA:
	bl sub_080488E0
_08048FCE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048FD4: .4byte gUnknown_02028E1C

