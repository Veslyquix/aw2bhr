	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08079618
sub_08079618: @ 0x08079618
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0
	bl sub_080795A8
	ldrh r0, [r5, #0x38]
	movs r1, #3
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _08079718 @ =gUnknown_0822AC60
	adds r0, r0, r1
	movs r1, #0xae
	lsls r1, r1, #2
	movs r2, #2
	bl sub_08013618
	ldr r0, [r5, #0x38]
	adds r0, #1
	str r0, [r5, #0x38]
	ldr r3, [r5, #0x2c]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xb4
	bl sub_08074234
	adds r1, r0, #0
	str r1, [r5, #0x34]
	subs r1, #0xac
	ldr r4, _0807971C @ =gUnknown_08615C20
	movs r0, #0xa6
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	movs r2, #0x50
	adds r3, r4, #0
	bl sub_0801BEBC
	ldr r1, [r5, #0x34]
	subs r1, #0xac
	ldr r0, _08079720 @ =0x00005310
	str r0, [sp]
	movs r0, #0
	movs r2, #0x60
	adds r3, r4, #0
	bl sub_0801BEBC
	ldr r1, [r5, #0x34]
	subs r1, #0xac
	ldr r0, _08079724 @ =0x00005320
	str r0, [sp]
	movs r0, #0
	movs r2, #0x70
	adds r3, r4, #0
	bl sub_0801BEBC
	ldr r1, [r5, #0x34]
	subs r1, #0xac
	ldr r3, _08079728 @ =gUnknown_08615C2E
	ldr r0, _0807972C @ =0x000052FC
	str r0, [sp]
	movs r0, #0
	movs r2, #0x80
	bl sub_0801BEBC
	ldr r1, [r5, #0x34]
	subs r1, #0xac
	ldr r0, _08079730 @ =0x00005330
	str r0, [sp]
	movs r0, #0
	movs r2, #0x88
	adds r3, r4, #0
	bl sub_0801BEBC
	ldr r7, _08079734 @ =gUnknown_081D92F0
	movs r6, #0x50
	ldr r0, _08079738 @ =0x000052D0
	mov r8, r0
	movs r4, #2
_080796C6:
	ldr r1, [r5, #0x34]
	subs r1, #0x24
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	adds r2, r6, #0
	ldr r3, [r7]
	bl sub_0801BEBC
	adds r6, #0x10
	subs r4, #1
	cmp r4, #0
	bge _080796C6
	ldr r1, [r5, #0x34]
	subs r1, #0x24
	ldr r3, [r7]
	ldr r0, _08079738 @ =0x000052D0
	str r0, [sp]
	movs r0, #0
	movs r2, #0x88
	bl sub_0801BEBC
	ldr r0, [r5, #0x2c]
	cmp r0, #0x27
	ble _0807973C
	adds r4, r5, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #7
	ble _0807970E
	movs r0, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807970E:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _08079740
	.align 2, 0
_08079718: .4byte gUnknown_0822AC60
_0807971C: .4byte gUnknown_08615C20
_08079720: .4byte 0x00005310
_08079724: .4byte 0x00005320
_08079728: .4byte gUnknown_08615C2E
_0807972C: .4byte 0x000052FC
_08079730: .4byte 0x00005330
_08079734: .4byte gUnknown_081D92F0
_08079738: .4byte 0x000052D0
_0807973C:
	adds r0, #1
	str r0, [r5, #0x2c]
_08079740:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

