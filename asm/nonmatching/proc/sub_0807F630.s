	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F630
sub_0807F630: @ 0x0807F630
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r0
	mov r5, r8
	adds r5, #0x64
	movs r0, #0
	ldrsh r4, [r5, r0]
	bl sub_0803BD14
	cmp r4, r0
	blt _0807F650
	b _0807F89C
_0807F650:
	movs r1, #0
	str r1, [sp]
	movs r6, #0
	mov sb, r5
	movs r2, #0x52
	add r2, r8
	mov sl, r2
	mov r3, r8
	adds r3, #0x4e
	str r3, [sp, #0xc]
	mov r4, r8
	adds r4, #0x66
	str r4, [sp, #0x10]
	mov r7, r8
	adds r7, #0x48
	str r7, [sp, #8]
	mov r0, r8
	adds r0, #0x68
	str r0, [sp, #0x14]
	mov r1, r8
	adds r1, #0x6a
	str r1, [sp, #4]
	b _0807F810
_0807F67E:
	ldr r1, _0807F6D4 @ =gUnknown_085C77A0
	ldrb r2, [r4, #2]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r6, r0
	adds r1, #0x3c
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	cmp r0, #0xff
	beq _0807F696
	b _0807F7CC
_0807F696:
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r6, r0
	bne _0807F6E4
	mov r4, sl
	ldrh r0, [r4]
	ldr r2, _0807F6D8 @ =gUnknown_03005948
	mov r7, r8
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r5, _0807F6DC @ =gUnknown_081D9378
	ldr r1, [r5]
	ldr r1, [r1]
	lsls r4, r6, #4
	subs r2, r4, r6
	lsls r2, r2, #2
	adds r2, r2, r1
	ldr r3, _0807F6E0 @ =gUnknown_030058E0
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	adds r2, #0x59
	strb r0, [r2]
	mov ip, r5
	adds r2, r4, #0
	b _0807F7E0
	.align 2, 0
_0807F6D4: .4byte gUnknown_085C77A0
_0807F6D8: .4byte gUnknown_03005948
_0807F6DC: .4byte gUnknown_081D9378
_0807F6E0: .4byte gUnknown_030058E0
_0807F6E4:
	cmp r6, r0
	bge _0807F710
	ldr r3, _0807F708 @ =gUnknown_081D9378
	ldr r0, [r3]
	ldr r0, [r0]
	lsls r2, r6, #4
	subs r1, r2, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0807F70C @ =gUnknown_030058D4
	ldr r4, [sp]
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r1, #0x59
	strb r0, [r1]
	adds r4, #1
	str r4, [sp]
	b _0807F7DE
	.align 2, 0
_0807F708: .4byte gUnknown_081D9378
_0807F70C: .4byte gUnknown_030058D4
_0807F710:
	ldr r0, _0807F73C @ =gUnknown_030059C0
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _0807F748
	ldr r3, _0807F740 @ =gUnknown_081D9378
	ldr r0, [r3]
	ldr r0, [r0]
	lsls r2, r6, #4
	subs r1, r2, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0807F744 @ =gUnknown_03005958
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r0, #1
	adds r1, #0x56
	strb r0, [r1]
	mov ip, r3
	adds r7, r6, #1
	b _0807F76A
	.align 2, 0
_0807F73C: .4byte gUnknown_030059C0
_0807F740: .4byte gUnknown_081D9378
_0807F744: .4byte gUnknown_03005958
_0807F748:
	adds r5, r6, #1
	adds r0, r5, #0
	movs r1, #1
	bl sub_08026AC0
	ldr r4, _0807F78C @ =gUnknown_081D9378
	ldr r1, [r4]
	ldr r2, [r1]
	lsls r3, r6, #4
	subs r1, r3, r6
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x56
	strb r0, [r1]
	mov ip, r4
	adds r2, r3, #0
	adds r7, r5, #0
_0807F76A:
	mov r1, ip
	ldr r0, [r1]
	ldr r1, [r0]
	subs r0, r2, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x56
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _0807F7A8
	lsls r0, r0, #2
	ldr r1, _0807F790 @ =_0807F794
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807F78C: .4byte gUnknown_081D9378
_0807F790: .4byte _0807F794
_0807F794: @ jump table
	.4byte _0807F7A8 @ case 0
	.4byte _0807F7AC @ case 1
	.4byte _0807F7B0 @ case 2
	.4byte _0807F7B4 @ case 3
	.4byte _0807F7B8 @ case 4
_0807F7A8:
	movs r3, #1
	b _0807F7BA
_0807F7AC:
	movs r3, #3
	b _0807F7BA
_0807F7B0:
	movs r3, #8
	b _0807F7BA
_0807F7B4:
	movs r3, #6
	b _0807F7BA
_0807F7B8:
	movs r3, #0xb
_0807F7BA:
	mov r4, ip
	ldr r0, [r4]
	ldr r1, [r0]
	subs r0, r2, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x59
	strb r3, [r0]
	b _0807F7E2
_0807F7CC:
	ldr r3, _0807F8AC @ =gUnknown_081D9378
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r6, #4
	subs r0, r2, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x59
	strb r4, [r0]
_0807F7DE:
	mov ip, r3
_0807F7E0:
	adds r7, r6, #1
_0807F7E2:
	mov r0, ip
	ldr r5, [r0]
	ldr r0, [r5]
	subs r4, r2, r6
	lsls r4, r4, #2
	adds r0, r4, r0
	adds r0, #0x59
	ldrb r0, [r0]
	bl sub_08042E18
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_08026AC0
	ldr r1, [r5]
	adds r1, r4, r1
	adds r1, #0x56
	movs r2, #0
	strb r0, [r1]
	ldr r0, [r5]
	adds r4, r4, r0
	str r2, [r4, #0x3c]
	adds r6, r7, #0
_0807F810:
	ldr r4, _0807F8B0 @ =gUnknown_03003FC0
	ldrb r0, [r4, #2]
	bl sub_0802490C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bge _0807F822
	b _0807F67E
_0807F822:
	ldr r1, _0807F8B4 @ =gUnknown_030033EC
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r1]
	ldr r0, _0807F8B8 @ =gUnknown_086165C0
	bl Proc_Find
	adds r4, r0, #0
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	bl sub_0807F8D0
	ldr r0, _0807F8BC @ =gUnknown_08616710
	adds r1, r4, #0
	bl Proc_StartBlocking
	mov r3, sl
	ldrh r0, [r3]
	adds r1, r4, #0
	adds r1, #0x52
	strh r0, [r1]
	ldr r7, [sp, #0xc]
	ldrh r0, [r7]
	subs r1, #4
	strh r0, [r1]
	mov r1, r8
	ldr r0, [r1, #0x58]
	str r0, [r4, #0x58]
	ldr r0, [r1, #0x5c]
	str r0, [r4, #0x5c]
	ldr r0, [r1, #0x60]
	str r0, [r4, #0x60]
	mov r2, sb
	ldrh r1, [r2]
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	ldr r3, [sp, #0x10]
	ldrh r0, [r3]
	adds r1, r4, #0
	adds r1, #0x66
	strh r0, [r1]
	mov r7, r8
	ldr r0, [r7, #0x40]
	str r0, [r4, #0x40]
	ldr r0, [sp, #8]
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	strh r1, [r0]
	ldr r2, [sp, #0x14]
	ldrh r1, [r2]
	adds r0, #0x20
	strh r1, [r0]
	ldr r3, [sp, #4]
	ldrh r1, [r3]
	adds r0, #2
	strh r1, [r0]
_0807F89C:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F8AC: .4byte gUnknown_081D9378
_0807F8B0: .4byte gUnknown_03003FC0
_0807F8B4: .4byte gUnknown_030033EC
_0807F8B8: .4byte gUnknown_086165C0
_0807F8BC: .4byte gUnknown_08616710

