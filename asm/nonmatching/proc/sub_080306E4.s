	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080306E4
sub_080306E4: @ 0x080306E4
	push {r4, lr}
	sub sp, #4
	ldr r1, _08030744 @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r0, _08030748 @ =gUnknown_0849B018
	ldr r1, [r0]
	ldrb r0, [r1, #1]
	movs r4, #0
	movs r0, #3
	strb r0, [r1, #1]
	bl sub_0802F23C
	ldr r1, _0803074C @ =gUnknown_030040C0
	movs r0, #0xa
	strh r0, [r1, #6]
	strh r4, [r1, #0xa]
	mov r0, sp
	movs r1, #1
	bl sub_0802F8FC
	ldr r1, _08030750 @ =gUnknown_0300410C
	ldr r0, _08030754 @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r4, _08030758 @ =gUnknown_03003128
	ldr r2, _0803075C @ =gUnknown_03003F48
	movs r3, #3
_0803071C:
	ldrh r0, [r4]
	ldrh r1, [r2]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0803071C
	ldr r0, _08030760 @ =gUnknown_0849B01C
	ldr r0, [r0]
	ldr r1, _08030764 @ =0x00000212
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r1, #0
	strh r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030744: .4byte 0x00007FFF
_08030748: .4byte gUnknown_0849B018
_0803074C: .4byte gUnknown_030040C0
_08030750: .4byte gUnknown_0300410C
_08030754: .4byte gUnknown_030040CC
_08030758: .4byte gUnknown_03003128
_0803075C: .4byte gUnknown_03003F48
_08030760: .4byte gUnknown_0849B01C
_08030764: .4byte 0x00000212

