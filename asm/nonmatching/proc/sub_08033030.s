	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033030
sub_08033030: @ 0x08033030
	push {r4, r5, lr}
	sub sp, #0x34
	adds r5, r0, #0
	ldr r4, _0803309C @ =gUnknown_03002EE0
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803304A
	movs r0, #0x68
	bl sub_0803B4DC
_0803304A:
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080330B6
	ldr r0, _080330A0 @ =gUnknown_0849B688
	bl Proc_Find
	cmp r0, #0
	bne _080330B6
	ldr r0, _080330A4 @ =gUnknown_0849B670
	bl Proc_Find
	cmp r0, #0
	bne _080330B6
	ldr r0, _080330A8 @ =gUnknown_0849B060
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	ldr r0, _080330AC @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _0803308E
	ldrb r0, [r2, #4]
	mov r1, sp
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080330B0
_0803308E:
	bl sub_0803BD54
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
	b _080330B6
	.align 2, 0
_0803309C: .4byte gUnknown_03002EE0
_080330A0: .4byte gUnknown_0849B688
_080330A4: .4byte gUnknown_0849B670
_080330A8: .4byte gUnknown_0849B060
_080330AC: .4byte gUnknown_0849B018
_080330B0:
	adds r0, r5, #0
	bl Proc_Break
_080330B6:
	add sp, #0x34
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

