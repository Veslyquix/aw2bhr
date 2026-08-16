	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022AF8
sub_08022AF8: @ 0x08022AF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	ldr r0, _08022B30 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x21
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #4
	bhi _08022B34
	movs r7, #2
	b _08022B42
	.align 2, 0
_08022B30: .4byte gUnknown_03004008
_08022B34:
	cmp r7, #8
	bls _08022B40
	cmp r7, #0x1c
	bhi _08022B40
	movs r7, #0
	b _08022B42
_08022B40:
	movs r7, #1
_08022B42:
	adds r0, r5, r7
	mov sb, r0
	mov r0, sl
	adds r4, r0, r7
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
	orrs r4, r0
	ldr r2, _08022BA4 @ =gUnknown_08499B6C
	ldr r6, _08022BA8 @ =0x00001365
	mov r0, sb
	adds r1, r4, #0
	adds r3, r6, #0
	bl sub_0801BD00
	ldr r0, [sp]
	adds r5, r5, r0
	subs r5, r5, r7
	ldr r2, _08022BAC @ =gUnknown_08499B74
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r6, #0
	bl sub_0801BD00
	ldr r4, [sp, #4]
	add r4, sl
	subs r4, r4, r7
	mov r0, r8
	orrs r4, r0
	ldr r2, _08022BB0 @ =gUnknown_08499B7C
	mov r0, sb
	adds r1, r4, #0
	adds r3, r6, #0
	bl sub_0801BD00
	ldr r2, _08022BB4 @ =gUnknown_08499B84
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r6, #0
	bl sub_0801BD00
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022BA4: .4byte gUnknown_08499B6C
_08022BA8: .4byte 0x00001365
_08022BAC: .4byte gUnknown_08499B74
_08022BB0: .4byte gUnknown_08499B7C
_08022BB4: .4byte gUnknown_08499B84

