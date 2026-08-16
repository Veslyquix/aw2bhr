	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030768
sub_08030768: @ 0x08030768
	push {r4, lr}
	sub sp, #4
	ldr r1, _080307BC @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r0, _080307C0 @ =gUnknown_0849B018
	ldr r1, [r0]
	ldrb r0, [r1, #1]
	movs r0, #0
	strb r0, [r1, #1]
	mov r0, sp
	movs r1, #1
	bl sub_0802F8FC
	ldr r1, _080307C4 @ =gUnknown_0300410C
	ldr r0, _080307C8 @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r4, _080307CC @ =gUnknown_03003128
	ldr r2, _080307D0 @ =gUnknown_03003F48
	movs r3, #3
_08030792:
	ldrh r0, [r4]
	ldrh r1, [r2]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _08030792
	ldr r3, _080307D4 @ =gUnknown_03003F1C
	ldr r2, _080307D8 @ =gUnknown_030044C4
	ldr r1, _080307DC @ =gUnknown_030040AC
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r0, [r2]
	strb r0, [r3]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080307BC: .4byte 0x00007FFF
_080307C0: .4byte gUnknown_0849B018
_080307C4: .4byte gUnknown_0300410C
_080307C8: .4byte gUnknown_030040CC
_080307CC: .4byte gUnknown_03003128
_080307D0: .4byte gUnknown_03003F48
_080307D4: .4byte gUnknown_03003F1C
_080307D8: .4byte gUnknown_030044C4
_080307DC: .4byte gUnknown_030040AC

