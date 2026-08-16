	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080585D4
sub_080585D4: @ 0x080585D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #0
	mov sb, r0
	mov sl, r0
	ldr r1, _08058600 @ =gUnknown_0816D93C
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp sb, r0
	bge _080586B2
_080585F2:
	movs r5, #0
	ldr r0, [r1]
	ldr r0, [r0]
	mov r2, sl
	adds r2, #1
	str r2, [sp]
	b _0805869C
	.align 2, 0
_08058600: .4byte gUnknown_0816D93C
_08058604:
	mov r2, sl
	lsls r0, r2, #2
	ldr r2, _0805867C @ =gUnknown_03003340
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08058694
	ldr r1, [r1]
	mov r8, r1
	ldr r1, [r1]
	mov r0, sl
	lsls r4, r0, #1
	ldr r3, _08058680 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r6, _08058684 @ =0x00001432
	adds r1, r1, r6
	adds r2, r1, r0
	ldrb r1, [r2]
	movs r7, #0x1f
	adds r0, r7, #0
	ands r0, r1
	ldr r1, _08058688 @ =gUnknown_085767D5
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08058694
	ldr r0, _0805868C @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldrb r1, [r2]
	str r3, [sp, #4]
	bl sub_08026FD0
	lsls r0, r0, #0x18
	ldr r3, [sp, #4]
	cmp r0, #0
	bne _08058694
	mov r2, r8
	ldr r1, [r2]
	adds r0, r1, r3
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, r0, r5
	adds r1, r1, r6
	adds r1, r1, r0
	ldrb r1, [r1]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #8
	bne _08058690
	movs r0, #0x1e
	add sb, r0
	b _08058694
	.align 2, 0
_0805867C: .4byte gUnknown_03003340
_08058680: .4byte 0x0000417A
_08058684: .4byte 0x00001432
_08058688: .4byte gUnknown_085767D5
_0805868C: .4byte gUnknown_03003F38
_08058690:
	movs r1, #1
	add sb, r1
_08058694:
	adds r5, #1
	ldr r1, _080586C4 @ =gUnknown_0816D93C
	ldr r0, _080586C8 @ =gUnknown_08499590
	ldr r0, [r0]
_0805869C:
	ldrh r0, [r0]
	cmp r5, r0
	blt _08058604
	ldr r2, [sp]
	mov sl, r2
	ldr r1, _080586C4 @ =gUnknown_0816D93C
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp sl, r0
	blt _080585F2
_080586B2:
	mov r0, sb
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080586C4: .4byte gUnknown_0816D93C
_080586C8: .4byte gUnknown_08499590

